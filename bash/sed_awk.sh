##### Tips #####
# Always rename the file ... 
# source and destination files should NEVER be SAME, as awk and sed are line by line operator

### Regular Expression Tutorial
http://www.regular-expressions.info/replacetutorial.html

### Script to rename files
### (Or use just bash command "rename -v -n 's/from/to/' files* ")
ls Y_* | awk '{FS="."}{ print "mv " $0 " " $1 ".txt.False"}' |bash
ls Y_* | awk '{FS="[_/.]"}{ print "mv " $0 " " $1 ".txt.False"}' |bash
# renames files with names Y_eyesxxx.txt to Y_eyesxxx.txt.False
# generates script with commands like
# mv Y_eyes103.txt Y_eyes103.txt.False

### Script to change column of "False" to "0" in all files
ls Y_* | awk '{FS="."}{ print "sed -n 's/False/0/gp' " $0 " > " $1 ".txt"}' |bash
#which gives script like
#sed -n s/False/0/gp Y_eyes103.txt > Y_eyes103.txt


# count line with more than 1 words (or lines except 1 word)
awk '{print NF}' tmp |sed /^1$/d |wc -l

ls Y_eyes*.txt.0 | awk '{FS="."}{print "awk \'{$NF=\"1\"}{print $0}\' " $0 " > " $1".txt"}'


### Script to sort by specific column
awk '{print $2, $0}' Y_correction.txt |sort -n |cut -f2- -d" "
# cut --> take field from 2 to end(-), separated by delimiter " "
sort -k 2 Y_correction.txt |less
# sort from column 2 onwards
sort -k 2,2 Y_correction.txt |less
# sort with column 2 field, if equal sort from start
# https://unix.stackexchange.com/questions/104525/sort-based-on-the-third-column
# https://unix.stackexchange.com/questions/332033/sort-by-columns
sort -o test_sorting.txt -k 2,2 -k 11,11 -k 3,3r Filename
 

### Command to join two files column wise
paste -d' ' one.txt two.txt > temp && mv temp one.txt



