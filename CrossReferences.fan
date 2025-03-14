import random
import re
from faker import Faker
from faker.providers import BaseProvider

fake = Faker()
HEADERS = []

SCIENTIFIC_SECTIONS = ["Abstract","Introduction","Methodology","Results","Discussion","Conclusion","Literature Review","Hypothesis","Experimental Setup","Data Analysis","Validation","Statistical Methods","Ethical Considerations","Limitations","References","Acknowledgments","Appendices"]

class PaperSectionProvider(BaseProvider):
    def paper_section(self):
        return random.choice(SCIENTIFIC_SECTIONS)

fake.add_provider(PaperSectionProvider)

def generate_paper_header():
    header_text = fake.paper_section()
    header = " " + header_text + " \n"
    HEADERS.append(header)
    return header

def generate_header():
    header_text = fake.sentence(nb_words=3)
    header = " " + header_text + " \n"
    HEADERS.append(header)
    return header

def generate_reference():
    random_header = random.choice(HEADERS).strip()

    lower = random_header.lower()
    name = lower.replace('#', '').strip()
    ref = re.sub('[^0-9a-zA-Z.]+', ' ', lower).strip().replace(' ', '-')

    return "Read [" +name +"](#"+ref +")"

CITATIONS=[]

def generate_citation():
    num_authors = random.randint(1, 3)
    authors_list = []
    for i in range(num_authors):
        full_name = fake.name()
        parts = full_name.split()
        last_name = parts[-1].rstrip(',')
        initial = parts[0][0] + "."
        authors_list.append(last_name + ", " + initial)
    
    if len(authors_list) == 1:
        authors_str = authors_list[0]
    elif len(authors_list) == 2:
        authors_str = authors_list[0] + ", & " + authors_list[1]
    else:
        authors_str = ", ".join(authors_list[:-1]) + ", & " + authors_list[-1]
    
    title = fake.sentence(nb_words=5).rstrip('.')
    
    journal = fake.catch_phrase()
    
    citation_str = authors_str + ". " + title + ". " + journal + ", "
    
    CITATIONS.append(citation_str)
    
    return "[^" + str(len(CITATIONS)+1) + "].\n\n" +	"[^" + str(len(CITATIONS)+1) + "]: " + citation_str + "\n"




