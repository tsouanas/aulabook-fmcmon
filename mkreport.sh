#!/bin/sh

REPORTOUT=./report.txt
TMPSTU=./tmp.stu
CONTENTDIR=content

umask 002

# clear file
echo -n > $REPORTOUT

# general lessons report
echo -n > $TMPSTU
for stu in $CONTENTDIR/*/*.*.stu; do
    cat $stu >> $TMPSTU
done
attcount=`cat $TMPSTU| wc -l | awk '{ print $1 }'`
stucount=`cat $TMPSTU|sort|uniq| wc -l | awk '{ print $1 }'`
echo "$stucount students have attended our classes so far, $attcount times in total." | tee -a $REPORTOUT
rm -f $TMPSTU

# per-teacher lessons report
teachers=`ls $CONTENTDIR/*/*.*.stu | awk -F/ '{ print $3 }' | awk -F. '{ print $2 }' | sort | uniq | paste -d" " -s -`
echo "Teachers with lessons: $teachers"
for teacher in $teachers; do
    echo "Processing lessons of $teacher."
    echo -n > $TMPSTU
    for stu in $CONTENTDIR/*/*.$teacher.stu; do
        cat $stu >> $TMPSTU
    done
    attcount=`cat $TMPSTU | wc -l | awk '{ print $1 }'`
    stucount=`cat $TMPSTU |sort|uniq| wc -l | awk '{ print $1 }'`
    echo "${teacher}: $stucount students, $attcount times in total." | tee -a $REPORTOUT
    rm -f $TMPSTU
done

# general office report
echo -n > $TMPSTU
for stu in $CONTENTDIR/*/????????.stu; do
    cat $stu >> $TMPSTU
done
attcount=`cat $TMPSTU| wc -l | awk '{ print $1 }'`
stucount=`cat $TMPSTU|sort|uniq| wc -l | awk '{ print $1 }'`
echo "$stucount students have been attended during our office hours so far, $attcount times in total." | tee -a $REPORTOUT
rm -f $TMPSTU

