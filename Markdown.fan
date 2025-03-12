from faker import Faker
fake = Faker()

<start> ::= "Some random text: \n" <headers> <lorem>
<text> ::= (<letters> " ") +

<_digit> ::= r'[0-9]'
<digit> ::= <_digit>
	
<digits> ::= <digit>+

<_ascii_letter> ::= r'[a-zA-Z]'
<ascii_letter> ::= <_ascii_letter>

<letters> ::= <ascii_letter>+

<emphasis> ::= "_" <text> "_" | "*" <text> "*" | "__" <text> "__" | "**" <text> "**" 

include('CrossReferences.fan')


<headers> ::= "# "+ <text> := generate_header()


<header> ::= <text>
<subheader> ::= <text>

<links> ::= "[" <text> "]" "(" <url> ") s" 

<url> ::= <printable>+ := fake.url()

<lorem> ::= <printable>+ := fake.paragraph()