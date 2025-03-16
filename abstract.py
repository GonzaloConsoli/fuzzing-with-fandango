import os
import random
from typing import List, Optional
from pydantic import BaseModel
from pydantic_ai import Agent, RunContext
from pydantic_ai.models.groq import GroqModel
from pydantic_ai.providers.groq import GroqProvider
from dotenv import load_dotenv

load_dotenv()

class AbstractGenerationParams(BaseModel):
    topic: str
    length: int = 250
    style: str = "academic"
    keywords: Optional[List[str]] = None

class GeneratedAbstract(BaseModel):
    abstract: str
    title: str

groq_model = GroqModel(
    'llama3-70b-8192',
    provider=GroqProvider(api_key=os.environ.get("GROQ_API_KEY"))
)

abstract_agent = Agent(
    groq_model,
    deps_type=AbstractGenerationParams,
    result_type=GeneratedAbstract,
    system_prompt=(
        "You are an expert academic writer. Generate concise, informative abstracts "
        "based on the provided parameters. Each abstract should be well-structured "
        "and include a suitable title."
    )
)

@abstract_agent.tool
async def generate_abstract(ctx: RunContext[AbstractGenerationParams]) -> str:
    """Generate an abstract based on the provided parameters"""
    params = ctx.deps
    keyword_text = ""
    if params.keywords:
        keyword_text = f" Include these keywords: {', '.join(params.keywords)}."
        
    return (f"Generate a {params.style} abstract of approximately {params.length} words "
            f"on the topic of {params.topic}.{keyword_text} "
            f"The abstract should be concise, informative, and well-structured. "
            f"Also provide a suitable title for this abstract.")

class AbstractGenerator:
    def __init__(self):
        api_key = os.environ.get("GROQ_API_KEY")
        if not api_key:
            raise ValueError("GROQ_API_KEY not found in environment variables")
        
        self.topics = [
            "artificial intelligence", "machine learning", "cybersecurity",
            "blockchain technology", "quantum computing", "cloud computing",
            "data science", "internet of things", "augmented reality",
            "neural networks", "robotics", "natural language processing"
        ]
        
        self.styles = ["academic", "technical", "conversational", "formal"]
        
        self.keyword_sets = {
            "artificial intelligence": ["neural networks", "machine learning", "algorithms", "deep learning"],
            "machine learning": ["supervised learning", "unsupervised learning", "classification", "regression"],
            "cybersecurity": ["encryption", "penetration testing", "vulnerability", "threat detection"],
        }
    
    def generate_abstract(self, params: Optional[AbstractGenerationParams] = None) -> GeneratedAbstract:
        """
        Generate an abstract using Groq via Pydantic AI.
        If no parameters are provided, random ones will be used.
        """
        if params is None:
            topic = random.choice(self.topics)
            style = random.choice(self.styles)
            length = random.randint(150, 350)
            
            keywords = self.keyword_sets.get(topic, [])
            if keywords and random.random() > 0.3:  # 70% chance to include keywords
                selected_keywords = random.sample(keywords, min(3, len(keywords)))
            else:
                selected_keywords = []
                
            params = AbstractGenerationParams(
                topic=topic,
                length=length,
                style=style,
                keywords=selected_keywords
            )
        
        # Run the agent with the parameters
        result = abstract_agent.run_sync("Generate an abstract", deps=params)
        return result.data

def generate_random_abstract():
    """
    Function to generate a random abstract.
    """
    generator = AbstractGenerator()
    abstract = generator.generate_abstract()
    return (abstract.title, abstract.abstract)

if __name__ == "__main__":
    result = generate_random_abstract()
    print(f"Title: {result.title}\n")
    print(f"Abstract: {result.abstract}")