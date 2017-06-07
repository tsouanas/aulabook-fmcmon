#!/bin/sh

AULALIST=aulalist.tex
CONTENTDIR=content
AULABOOKNAME=aulabook
ENGINE=xelatex

# patterns
SEMESTERPATTERN=????.?
AULAPATTERN=????????.*.tex

# check that engine exists
command -v $ENGINE
if [ $? -ne 0 ]; then
    echo "Engine '$ENGINE' not found.  Either install it or switch to a different engine."
    exit 2
fi

# create new AULALIST file
echo -n > $AULALIST
if [ $? -ne 0 ]; then
    echo "Cannot write aula list on $AULALIST."
    exit 1
fi

# process semesters
for sem in $CONTENTDIR/$SEMESTERPATTERN; do

    # SEMESTERPATTERN must match something
    if [ ! -e $sem ]; then
        echo "Semester pattern $CONTENTDIR/$SEMESTERPATTERN doesn't match anything.  Nothing to do."
        exit 0
    fi

    # SEMESTERPATTERN must match only directories
    if [ ! -d $sem ]; then
        echo "$sem should have been a directory, but isn't.  Aborting."
        exit 1
    fi

    # put a \semester{..} for each semester
    echo -n $sem | awk -F/ '{ print "\\semester{" $2 "}" }' >> $AULALIST

    # AULAPATTERN must match something
    if [ ! -e $sem/$AULAPATTERN ]; then
        echo "Semester $sem has no aulas matching $AULAPATTERN.  Nothing to do."
        continue
    fi
    
    # include each aula inside its teacher's environment
    for aula in $sem/$AULAPATTERN; do
        echo "Processing aula $aula."
        lessondir=`echo $aula | cut -f3 -d/ | cut -f1 -d.`
        teacher=`echo $aula | cut -f3 -d/ | cut -f2 -d.`
        lessony=`echo $lessondir | cut -b '1-4'`
        lessonm=`echo $lessondir | cut -b '5-6'`
        lessond=`echo $lessondir | cut -b '7-8'`
        lessondate="${lessond}/${lessonm}/${lessony}"
        echo -n "\\\\begin{$teacher}" >> $AULALIST
        echo    "{$lessondate}"       >> $AULALIST
        echo    "\\\\input{$aula}"    >> $AULALIST
        echo    "\\\\end{$teacher}"   >> $AULALIST
    done

done

# compile aulabook
$ENGINE $AULABOOKNAME \
    && bibtex8   $AULABOOKNAME \
    && makeindex $AULABOOKNAME \
    && $ENGINE   $AULABOOKNAME \
    && $ENGINE   $AULABOOKNAME
