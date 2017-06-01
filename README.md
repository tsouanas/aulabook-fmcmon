# AulaBook for teaching assistants of FMC at IMD, UFRN

Simple setup for creating diary of exercise sessions taught by
teaching assistants.  Used by the project
"[projeto de monitoria FMC][fmcmonsite]".

For the time being it is **only** usable by my teaching assistants (TA),
but we plan to demodulize into something more flexible and re-usable
by other similar projects.


## Projeto de monitoria FMC @IMD, UFRN

* Thanos Tsouanas (supervisor)
* Bianca Rodrigues Cesarino (TA)
* Victor Rafael Santos Silva (TA)


## Class content 

* Bianca Rodrigues Cesarino
* Victor Rafael Santos Silva


## For the teaching assistants (TA)

For each lesson, place two files under `content/YYYY.N`:

    YYYYMMDD.yourname.tex
    YYYYMMDD.yourname.stu

where `YYYYMMDD` is the date the lesson takes place,
`yourname` is your handle, and `YYYY.N` is the semester.
(Patterns are customizable.)

* The `.tex` file is a LaTeX file with the contents of that class.
* The `.stu` file is a plain text file with the names of the students.
  One name per line, no blank lines.)

For example, for a class given on 18/05/2017 by Bianca on 2017.1,
she will create the following two files:

* `content/2017.1/20170518.bianca.tex`
* `content/2017.1/20170518.bianca.stu`


## Requirements

Use of the AulaBook scripts requires a Unix-based system.
Other than that, the whole thing should be compilable in
any system with a relatively modern
[distribution of TeX][texlive].


## Compilation:

To compile AulaBook:

    make

To upload the compiled AulaBook:

    make upload

To remove auxiliary compilation files:

    make clean

To remove even the pdf:

    make cleanall


## Further info

Check the TIPS file for more tips.


[fmcmonsite]: http://fmc.imd.ufrn.br/
[aulabookfmc]: http://fmc.imd.ufrn.br/aulabook/
[texlive]: https://www.tug.org/texlive/
