all: hw8.pdf

clean:
	rm -rf *.aux *.log *.lst *.png *~ *.ps hw8prob1.pdf

hw8.pdf: hw8.tex hw8prob1.pdf hw8p1.png hw8p13.png hw8p16.png hw8p19.png
	pdflatex hw8.tex

hw8.tex:

hw8p1.png: hw8prob1.pdf

hw8p13.png: hw8prob1.pdf

hw8p16.png: hw8prob1.pdf

hw8p19.png: hw8prob1.pdf

hw8prob1.pdf: p14_4ho3.sas
	sas -config "C:\Program Files\SASHome2\SASFoundation\9.4\nls\en\sasv9.cfg" -sysin p14_4ho3.sas

p14_4ho3.sas:

