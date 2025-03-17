# Fuzzing with Fandango

This repository contains work completed for Andreas Zeller's "Fuzzing with Fandango" course. The final project is a fuzzer that generates academic papers.

## About the Project

The project combines multiple technologies to generate research papers:

1. **Fandango** - A fuzzer framework for generating structured content
2. **Markdown Generation** - Generates a basic paper structure
3. **LaTeX Compilation** - Converts the markdown to a professional PDF paper

The system also includes capabilities for abstract generation using Groq's LLM API.

## Prerequisites

- Python 3.10+
- Pandoc
- pdflatex (TeX Live)
- Groq API key (for abstract generation)

## Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your environment variables:
   ```bash
   export GROQ_API_KEY="your-api-key-here"
   ```
   or create a .env file with your Groq API key.

## Usage

To generate a paper, simply run:

```bash
make
```

This will:
1. Use Fandango to generate a markdown file
2. Convert the markdown to LaTeX
3. Compile the LaTeX into a PDF

**Note:** The population size has been reduced to 1 to improve execution speed.

## Components

- **Paper.fan**: The Fandango grammar specification for paper generation
- **abstract.py**: Abstract generation using Groq's LLMs
- **Makefile**: Orchestrates the paper generation process

## Output

After running `make`, you'll find:
- main.md: The generated markdown paper
- out.tex: The converted LaTeX file
- out.pdf: The final compiled paper

## Acknowledgements

This project was developed as part of Andreas Zeller's "Fuzzing with Fandango" course.