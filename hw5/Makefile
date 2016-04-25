all: hw5.pdf

clean:
	rm -rf *.aux *.log *.lst *.png

hw5.pdf: hw5.tex hw5p1.lst hw5p2.lst hw5p5c.lst hw5p5c.png hw5p5f.lst hw5p6.lst
	pdflatex hw5.tex

hw5.tex:

hw5p2.lst: hw5p1.lst

hw5p1.lst: hw5p1.sas
	sas -config \PROGRA~1\SASHome2\SASFoundation\9.4\sasv9.cfg -sysin hw5p1.sas

hw5p1.sas:

hw5p5c.png: hw5p5c.lst

hw5p5f.lst: hw5p5c.lst

hw5p5c.lst: hw5p5.sas
	sas -config \PROGRA~1\SASHome2\SASFoundation\9.4\sasv9.cfg -sysin hw5p5.sas

hw5p6.lst: hw5p6.sas
	sas -config \PROGRA~1\SASHome2\SASFoundation\9.4\sasv9.cfg -sysin hw5p6.sas

hw5p6.sas:
