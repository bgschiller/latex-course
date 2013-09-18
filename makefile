all: student presentation
	mkdir latex_class
	mv student_files latex_class/
	cp latex_slides.pdf latex_class/
	cp latex_presentation.pdf latex_class/
	cp latex_worksheet.pdf latex_class/
	cp latex_worksheet.tex latex_class/
	cp intro_to_latex.pdf latex_class/
	cp intro_to_latex.tex latex_class/
	cp vangogh_shoes.jpg latex_class/
	zip -r latex_class.zip latex_class/

book:
	@pdflatex intro_to_latex.tex
	pdflatex intro_to_latex.tex
	#We have to run latex twice in order to get the sections to renumber and the table of contents to catch up

presentation:
	pdflatex latex_presentation.tex

worksheet:	
	pdflatex latex_worksheet.tex

#slides without transitions
slides:
	pdflatex latex_slides.tex

#make student handout files
student: book worksheet slides
	mkdir student_files
	cp intro_to_latex.tex student_files/
	cp intro_to_latex.pdf student_files/
	cp latex_slides.pdf student_files/
	cp vangogh_shoes.jpg student_files/
	cp latex_worksheet.pdf student_files/
	zip -r student_files.zip student_files/

#remove intermediate and by-product files
neat:
	rm -f *.aux *.log *.out *.toc *.nav *.vrb *.snm
	rm -rf latex_class student_files

#remove all but source files
clean: neat
	rm -f *.pdf *.zip
