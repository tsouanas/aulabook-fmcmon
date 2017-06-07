all: aulabook report

aulabook: clean
	sh mkaulabook.sh

report:
	sh mkreport.sh

upload:
	cut -f1 -d\\ aulabook.compiletime > aulabook.compiletime.txt
	scp aulabook.pdf aulabook.count aulabook.compiletime.txt fmc.imd.ufrn.br:fmcmonsite/aulabook/
	scp report.txt fmc.imd.ufrn.br:fmcmonsite/report/report.txt

clean:
	rm -f aulabook.{aux,bbl,bcf,blg,idx,ilg,ind,log,out,toc,run.xml}
	rm -f {aulabookmac,titlepage,mathmac}.aux
	rm -f aulabook-blx.bib
	rm -f aulalist.tex
	rm -f aulabook.{count,compiletime}

cleanall: clean
	rm -f aulabook.pdf
	rm -f aulabook.compiletime.txt
	rm -f report.txt

