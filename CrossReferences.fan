import random

HEADERS = []

def generate_header():
    header = f"### header example" + "{len(HEADERS)}"
    HEADERS.append(header)
    return header

def generate_reference():
    random_header = random.choice(HEADERS)

    lower = random_header.lower()

    ref = random_header.replace(' ', '-')

    return f"Read [{lower}]({ref})"

