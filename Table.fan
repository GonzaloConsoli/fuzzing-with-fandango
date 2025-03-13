
<start> ::= "Table:\n\n" <table>

<table> ::= <headerRow> "\n" <delimRow> "\n" <row>{5}

<headerRow> ::= <headerCell>{3} "|"

<headerCell> ::= "|" <column_name>

<column_name> ::=
    "ID"
  | "Group"
  | "Subgroup"
  | "Variable"
  | "Category"
  | "Condition"
  | "Treatment"
  | "Control"
  | "Value"
  | "Measurement"
  | "Unit"
  | "Mean (M)"
  | "Standard Deviation (SD)"
  | "Standard Error (SE)"
  | "Variance"
  | "Coefficient of Variation (CV)"
  | "Median"
  | "Mode"
  | "Minimum"
  | "Maximum"
  | "Range"
  | "Interquartile Range (IQR)"
  | "Skewness"
  | "Kurtosis"
  | "Number of Observations (n)"
  | "Sample Size (N)"
  | "Degrees of Freedom (df)"
  | "95% Confidence Interval (CI)"
  | "Standard Error of the Mean (SEM)"
  | "Effect Size"
  | "p-value"
  | "t-value"
  | "F-value"
  | "Z-score"
  | "Odds Ratio (OR)"
  | "Relative Risk (RR)"
  | "Hazard Ratio (HR)"
  | "Correlation Coefficient (r)"
  | "Regression Coefficient (β)"
  | "R-squared (R²)"
  | "Adjusted R-squared"
  | "Chi-Square (χ²)"
  | "Likelihood Ratio"
  | "Akaike Information Criterion (AIC)"
  | "Bayesian Information Criterion (BIC)"
  | "Confidence Level"
  | "Significance Level (α)"
  | "Power (1-β)"
  | "Test Statistic"
  | "Null Hypothesis (H₀)"
  | "Alternative Hypothesis (H₁)"
  | "Conclusion"
  | "Interpretation"
  | "Notes"
  | "Remarks"


<delimRow> ::= <delimCell>{3} "|"

<delimCell> ::= "|" " ---"

<row> ::= <dataCell>{3} "|" "\n"

<dataCell> ::= "|" " " <number>

<number> ::= <digits>
<digits> ::= <digit>{2,3}

where int(<digits>) < 1000 and int(<digits>) > 10 and
 ( (not len(<digits>)==3) or (not (str(<digits>)[0] == '0') ) )