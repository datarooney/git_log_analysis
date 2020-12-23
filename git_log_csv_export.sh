#!/bin/sh
echo Which file extension would you like to look at?
read FILE_EXTENSION
FOLDER_NAME=$(basename $PWD)
echo "Exporting git logs to csv for ${FILE_EXTENSION} files in ${FOLDER_NAME}"
mkdir -p ../meta
git ls-tree --name-only -z -r HEAD|egrep -z -Z -E "\.${FILE_EXTENSION}$" |xargs -0 -n1 -t git log --date=iso --numstat --pretty=format:"%h,%an,%ad,%cn,%cd" | tr -s '\r\n\t' ',,,' | sed "s/\.${FILE_EXTENSION},/\.${FILE_EXTENSION}\n/g" | sed -r 's/([0-9]{4}),([0-9,a-z,A-Z]{9},[a-z,A-Z])/\1\n\2/g' >> ../meta/${FOLDER_NAME}_git_log_output.csv
echo "export complete"
