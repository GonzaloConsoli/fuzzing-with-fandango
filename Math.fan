<start> ::= <line_equation>

<line_equation> ::= <equation>{4,10} "\\par \\bigskip"

<equation> ::= "$" <expr> "$"

<expr> ::=
    <basic_expr>
  | <sum_expr>
  | <integral_expr>
  | <fraction_expr>
  | <power_expr>
  | <trig_expr>
  | <greek_expr>

<basic_expr> ::= <var> <op> <var>

<op> ::=
    " + "
  | " - "
  | " \\times "
  | " \\cdot "
  | " \\div "

<sum_expr> ::= "\\sum_{" <var> "=" <small_number> "}^{" <small_number> "} " <var> "^" <power>

<integral_expr> ::= "\\int_{" <small_number> "}^{" <small_number> "} " <var> " \\, d" <var>

<fraction_expr> ::= "\\frac{" <var> "}{" <var> "}"

<power_expr> ::= <var> "^" <power>

<power> ::= <small_number>

<trig_expr> ::=
    "\\sin(" <var> ")"
  | "\\cos(" <var> ")"
  | "\\tan(" <var> ")"

<greek_expr> ::=
    "\\alpha"
  | "\\beta"
  | "\\gamma"
  | "\\Omega"
  | "\\theta"

<var> ::=
    "x"
  | "y"
  | "z"
  | "n"
  | "m"

<small_number> ::= <digit> | <digit><digit>
<digit> ::= r'[0-9]'
