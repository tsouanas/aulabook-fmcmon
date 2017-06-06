all: aulabook report

aulabook: clean
	sh mkaulabook.sh

report:
	sh mkreport.sh

upload:
	scp aulabook.pdf fmc.imd.ufrn.br:fmcmonsite/aulabook/
	cut -f1 -d\\ aulabook.compiletime >> aulabook.compiletime.txt
	scp aulabook.compiletime.txt fmc.imd.ufrn.br:fmcmonsite/aulabook/
	scp report.html fmc.imd.ufrn.br:fmcmonsite/report/index.html

clean:
	rm -f aulabook.{aux,bbl,bcf,blg,idx,ilg,ind,log,out,toc,run.xml}
	rm -f {aulabookmac,titlepage,mathmac}.aux
	rm -f aulabook-blx.bib
	rm -f aulalist.tex

cleanall: clean
	rm -f aulabook.pdf
	rm -f aulabook.compiletime
	rm -f aulabook.compiletime.txt

