import random
import re

HEADERS = []

def generate_header():
    header = "### header example" + str(len(HEADERS)) + " \n"
    HEADERS.append(header)
    return header

def generate_reference():
    random_header = random.choice(HEADERS).strip()

    lower = random_header.lower()
    name = lower.replace('#', '').strip()
    ref = re.sub('[^0-9a-zA-Z]+', ' ', lower).strip().replace(' ', '-')

    return "Read [" +name +"](#"+ref +")"

