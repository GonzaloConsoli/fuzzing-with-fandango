all: paper

.PHONY: main.md

paper: main.md
	@echo "Generating LaTeX file from Markdown..."
	@pandoc -s --from=markdown+yaml_metadata_block --to=latex main.md > out.tex
	@echo "Compiling LaTeX document..."
	@pdflatex out &> /dev/null
	@echo "Compilation complete! Check the output."

main.md:
	@echo "Generating Markdown with Fandango..."
	@fandango fuzz -f Paper.fan --population-size 1 -n 1 > main.md
	@echo "Markdown generation complete!"
