#!/bin/sh
#get repo name for use in output filename later
FOLDER_NAME=$(basename $PWD)
echo "Exporting git logs to json for ${FOLDER_NAME} repo"
# create meta folder if it doesnt exist already
mkdir -p ../meta
# export git log, including rowcounts and filenames where lines have been inserted or deleted.
git log --date=iso --numstat --pretty=format:'"},{"commit_hash": "%h","author": "%an","author_date": "%ad","committer": "%cn","commit_date": "%cd","numstat": "' |
sed -r 's/([0-9]{4}-[0-9]{2}-[0-9]{2})\s([0-9]{2}:[0-9]{2}:[0-9]{2})\s([-|+][0-9]{2})([0-9]{2})/\1T\2\3:\4/g' | 
tr -s '\r\n\t' ',,,' |
sed -r 's/,-,-,[^,"]+//g' |
sed -r 's/,([0-9]+)\,([0-9]+)\,([^,"]+)/{"inserted": \1, "deleted": \2, "file_path": "\3"},/g' |
sed -r 's/("numstat": )"\{/\1[{/g' |
sed -r 's/"\},,"\}/"}]}/g' |
sed -r 's/^.{3}/[/g' |
sed -r 's/.$/]/g' |
sed -r 's/("}]},)/\1\n/g'|
sed -r 's/(numstat": )]/\1""}]/g' |
sed -r 's/(: "[^\,"]+)\\([^,"]+)/\1\\\\\2/g' |
sed -r 's/"\},,([^{"])/,\1/g' |
sed -r 's/([a-zA-Z]+)\}\{/\1"\},\{/g' |
sed -r 's/([a-zA-Z])\{/\1"\},{/g' |
sed -r 's/"\},\{"/"\},\n\{"/g' > \
../meta/${FOLDER_NAME}_git_log_output.json
echo "export complete"
