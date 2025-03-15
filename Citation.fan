# Task 8: Citations 

import random
import re
from faker import Faker
fake = Faker()

<start>::= <full_citation>

<full_citation> ::= <citation> <year_citation>".\n"

<citation> ::= <printable>+ := generate_citation()

# We are doing random.randint for the year because this is a lot faster than
# generating a 4 digit number and then applying the constraint
<year_citation> ::= <digit>+ := random.randint(1900, 2030)

where int(<year_citation>) > 1950 and int(<year_citation>) < 2025


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
