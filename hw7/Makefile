all: hw7.pdf

clean:
	rm -rf *.aux *.log *.lst *.png *~ *.ps hw7prob1a.pdf hw7prob1b.pdf hw7prob3.pdf hw7prob4.pdf hw7prob5.pdf hw7prob6.pdf

hw7.pdf: hw7.tex hw7prob1a.pdf hw7prob1b.pdf hw7p1a.png hw7p1a3.png hw7prob3.pdf hw7prob4.pdf hw7prob5.pdf hw7prob6.pdf
	pdflatex hw7.tex

hw7.tex:

hw7prob3.pdf: hw7prob1a.pdf

hw7p1a.png: hw7prob1a.pdf

hw7p1a3.png: hw7prob1a.pdf

hw7prob1b.pdf: hw7prob1a.pdf

hw7prob1a.pdf: p13_1.sas
	sas -config "C:\Program Files\SASHome2\SASFoundation\9.4\nls\en\sasv9.cfg" -sysin p13_1.sas

p13_1.sas:

hw7prob4.pdf: prob4.sas
	sas -config "C:\Program Files\SASHome2\SASFoundation\9.4\nls\en\sasv9.cfg" -sysin prob4.sas

prob4.sas:

hw7prob5.pdf: prob5.sas
	sas -config "C:\Program Files\SASHome2\SASFoundation\9.4\nls\en\sasv9.cfg" -sysin prob5.sas

prob5.sas:

hw7prob6.pdf: prob6.sas
	sas -config "C:\Program Files\SASHome2\SASFoundation\9.4\nls\en\sasv9.cfg" -sysin prob6.sas

prob6.sas:

