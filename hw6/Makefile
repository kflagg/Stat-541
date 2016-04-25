all: hw6.pdf

clean:
	rm -rf *.aux *.log *.lst *.png *~

hw6.pdf: hw6.tex hw6p1.lst hw6p2glm.lst hw6p2univ.lst
	pdflatex hw6.tex

hw6.tex:

hw6p1.lst: BIBD_HO.SAS
	sas -config "C:\Program Files\SASHome2\SASFoundation\9.4\nls\en\sasv9.cfg" -sysin BIBD_HO.SAS

BIBD_HO.SAS:

hw6p2univ.lst: hw6p2glm.lst

hw6p2glm.lst: CLOVR_H2.SAS
	sas -config "C:\Program Files\SASHome2\SASFoundation\9.4\nls\en\sasv9.cfg" -sysin CLOVR_H2.SAS

CLOVR_H2.SAS:
