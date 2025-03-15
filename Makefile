all: paper

# If you decide to go with pandoc-citeproc
#	pandoc -s -F pandoc-crossref -F pandoc-citeproc meta.yaml --data-dir=data-dir --template=mytemplate.tex -N \
#	-f markdown -t latex+raw_tex+tex_math_dollars+citations -o main.pdf main.md

# You can still use pandoc-crossref to easily reference figures with [@fig:label]

paper:
	 @pandoc -s --from=markdown+yaml_metadata_block --to latex main.md > out.tex
	 @pdflatex out &> /dev/null

