include('Math.fan')
include('Table.fan')
include('Natural.fan')
include('Markdown.fan')



<start> ::= "\n" <section>{5}
<section> ::= <main_header> "\n" <P> "\n"
<main_header> ::= "\n" "# " <paper_header>
<sub_header> ::= "\n" "#"{2,6} " " <paper_header>
<P> ::= <paragraph>  ("\n" <sub_header> <Q>){2,} 
<Q> ::= <paragraph> "\n\n" <line_equation> "\n" <paragraph> "\n" <content> "\n" <paragraph>
<content> ::= <full_citation> "\n" <table> <reference> 

<paper_header> ::= <printable>+ := generate_paper_header()


<title> ::= "# A title"

