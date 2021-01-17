#!/bin/sh
FOLDER_NAME=$(basename $PWD)
# files added or deleted
git log -n3 --name-status --pretty=format:'"}],{"commit_hash": "%h", "file_changes": [{"' |
tr -s '\r\n\t' '¬¬¬' |
sed -r 's/\¬(.)\¬([^¬"\}]+)/file_operation": "\1", "file_path": "\2"\},\{"/g' |
sed -r 's/(\}\]),(\{"commit_hash")/\1\},\n\2/g' |
sed -r 's/\},\{"¬"//g' |
sed -r 's/,\{"\¬$/\]\}\]/g' |
sed -r 's/^"\}\]\},$/\[/g' > \
../meta/${FOLDER_NAME}_file_changes.json
