
<start> ::= "Here is a table:\n\n" <table>

<table> ::= <headerRow> "\n" <delimRow> "\n" <row>{5}

<headerRow> ::= <headerCell>{3} "|"

<headerCell> ::= "|" <column_name>

<column_name> ::=
    "ID"
  | "Group"
  | "Variable"
  | "Value"
  | "Mean (M)"
  | "Standard Deviation (SD)"
  | "Median"
  | "Range"
  | "Number of Observations (n)"
  | "95% Confidence Interval (CI)"
  | "p-value"
  | "Conclusion"

<delimRow> ::= <delimCell>{3} "|"

<delimCell> ::= "|" " ---"

<row> ::= <dataCell>{3} "|" "\n"

<dataCell> ::= "|" " " <number>

<number> ::= <digits>
<digits> ::= <digit>{1,3}

where int(<digits>) < 1000 and int(<digits>) > 10