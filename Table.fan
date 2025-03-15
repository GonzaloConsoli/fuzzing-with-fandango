# Task 4: Tables
# Task 5: Constraints

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
  | "p-value ($p$)"
  | "t-value ($t$)"
  | "F-value ($F$)"
  | "Z-score ($z$)"
  | "Odds Ratio (OR)"
  | "Relative Risk (RR)"
  | "Hazard Ratio (HR)"
  | "Correlation Coefficient ($r$)"
  | "Regression Coefficient ($\\beta$)"
  | "R-squared ($R^2$)"
  | "Adjusted R-squared"
  | "Chi-Square ($\\chi^2$)"
  | "Likelihood Ratio"
  | "Akaike Information Criterion (AIC)"
  | "Bayesian Information Criterion (BIC)"
  | "Confidence Level"
  | "Significance Level ($\\alpha$)"
  | "Power ($1 - \\beta$)"
  | "Test Statistic"
  | "Null Hypothesis ($H_0$)"
  | "Alternative Hypothesis ($H_1$)"
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