### README

This is a personal project to examine the git logs and understand the inner workings of git.

At present there is one file. This is a shell script to loop through all the files in a git repo and output the log for each file to a single csv file.

__notes:__
1. The script is intended to provide a file by file output at a specific commit not to examine the entire git log of the branch. In other words, this will only export data for files that exist at the point checked out. If files have been deleted and do not currently exist in the repo, these will be ommitted from the results.

1. If historic versions are to be examined, for example if 'tidy-up' excercises have removed files, these can be examined by checking out a commit from prior to their deletion, then running the script.

1. The script asks for a file extension. This is the extension WITHOUT the preceding period, e.g. for python 'py' will return results. '.py' will not.

1. The script only takes one file extension at a time but appends to an existing file where it exists. Thus, running the script again for another extension will include these entries in the same output file. e.g. entering 'py' on the first run will return the git logs for all the python files. running the same script again immediately and entering 'sql' will append the logs for the sql files to the logs for the python files.

1. The output file is a csv without headers. Sorry about that.

1. The headers are: commit,author,author_date,committer,commit_date,inserted,deleted,file_path




