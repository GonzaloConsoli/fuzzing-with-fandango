# Task 1: Basic Markdown
# Task 2: Fakers 
# Task 3: Some Natural Text

from faker import Faker
fake = Faker()
include('CrossReferences.fan')
include('Citation.fan')

<start> ::= "\n" <header_complete> "\n" <lorem> <reference> <full_citation> "\n"
<text> ::= (<letters> " ") +

<_digit> ::= r'[0-9]'
<digit> ::= <_digit>
	
<digits> ::= <digit>+

<_ascii_letter> ::= r'[a-zA-Z]'
<ascii_letter> ::= <_ascii_letter>

<letters> ::= <ascii_letter>+

<emphasis> ::= "_" <text> "_" | "*" <text> "*" | "__" <text> "__" | "**" <text> "**" 

<header_complete> ::= "#"{1,6} <header>

<header> ::= <printable>+ := generate_header()

<links> ::= "[" <text> "]" "(" <url> ")" 

<url> ::= <printable>+ := fake.url()

<lorem> ::= <printable>+ := fake.paragraph(nb_sentences=10 )

<reference> ::= <printable>+ := generate_reference()

