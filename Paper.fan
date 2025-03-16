# Task 9: A Paper Generator 

include('Math.fan')
include('Table.fan')
include('Natural.fan')
include('Markdown.fan')

# ABOUT OUR GRAMMAR RULES 

# We came across some issues while defining the grammar for our paper generator.
# For example, for the rule <content> we initially thought to write something like 
# <content> ::= <line_equation> | <full_citation> | <table> | <reference> 
# But when we ran the fuzzer, the output generated only considered <line_equation>
# and ignored all other options. Not only that, but <line_equation> only generates 
# math formulas that only use greek letters and nothing else, ignoring all other
# rules defined in our Math grammar in Math.fan.
# We couldn't understand nor change this behaviour, so we had to "force" the generation
# of contents like in the rule:
# <content> ::= <full_citation> "\n" <table> <reference> 
# We mention this because we consider that our original idea for our grammar had a
# neater structure, but had to change it because of these restrictions we encountered.

# We also found that fandango ignored the constraints we applied when we ran our
# fuzzer for the paper that integrated all files. Note that the constraints worked when 
# we ran the fuzzer on the individual grammars (for example, fandango did apply the number
# constraint on the Table.fan).

<start> ::= <abstract> "\n" <section>{5}
<section> ::= <main_header> "\n" <P> "\n"
<main_header> ::= "\n" "# " <paper_header>
<sub_header> ::= "\n" "#"{2,6} " " <paper_header>
<P> ::= <paragraph>  ("\n" <sub_header> <Q>){2,} 
<Q> ::= <paragraph> "\n\n" <line_equation> "\n" <paragraph> "\n" <content> "\n" <paragraph>
<content> ::= <full_citation> "\n" <table> <reference> 

<paper_header> ::= <printable>+ := generate_paper_header()

<title> ::= <composed_S>

<author> ::= "Gonzalo Consoli" | "Belen Loleo Saigos"

from abstract import generate_random_abstract

<abstract> ::= <printable>+ :=  abstract_wrapper()

def abstract_wrapper():
    title, abstract = generate_random_abstract()
    return "---\ntitle: |\n\t " + title + "\nauthor:\n- Belen Loleo Saigos\n- Gonzalo Consoli"+"\nabstract: |\n\t" + abstract + "\n...\n"


