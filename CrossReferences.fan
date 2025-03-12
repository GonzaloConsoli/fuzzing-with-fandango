import random
import re
from faker import Faker
fake = Faker()
HEADERS = []

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

