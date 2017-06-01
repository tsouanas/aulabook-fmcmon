all: aulabook report

aulabook:
	sh mkaulabook.sh

upload:
	scp aulabook.pdf fmc.imd.ufrn.br:fmcmonsite/aulabook/

report:
	sh mkreport.sh

clean:
	rm -f aulabook.{aux,bbl,bcf,blg,idx,ilg,ind,log,out,toc,run.xml}
	rm -f {aulabookmac,titlepage,mathmac}.aux
	rm -f aulabook-blx.bib
	rm -f aulalist.tex

cleanall: clean
	rm -f aulabook.pdf
	rm -f aulabook.compiletime

