### README  - CSV output

##N.B. this describes csv output. JSON output is currently in dev. Readme on JSON output to follow shortly - datarooney - 2021-01-17

This is a personal project to examine the git logs and understand the inner workings of git.

At present there is one file. This is a shell script to loop through all the files in a git repo and output the log for each file to a single csv file.

__notes:__
1. The script is intended to provide a file by file output at a specific commit not to examine the entire git log of the branch. In other words, this will only export data for files that exist at the point checked out. If files have been deleted and do not currently exist in the repo, these will be ommitted from the results.

1. If historic versions are to be examined, for example if 'tidy-up' excercises have removed files, these can be examined by checking out a commit from prior to their deletion, then running the script.

1. The script asks for a file extension. This is the extension WITHOUT the preceding period, e.g. for python 'py' will return results. '.py' will not.

1. The script only takes one file extension at a time but appends to an existing file where it exists. Thus, running the script again for another extension will include these entries in the same output file. E.g. Entering 'py' on the first run will return the git logs for all the python files. Running the same script again immediately and entering 'sql' will append the logs for the sql files to the logs for the python files. Repeat this process for all file types, or as necessary.

1. The output file is a csv without headers. Sorry about that.

1. The headers are: commit,author,author_date,committer,commit_date,inserted,deleted,file_path

##### HOW TO

1. Copy the file 'git_log_csv_export.sh' into a git repo.
1. Execute the script from a terminal window.
1. Enter the file extension without the period e.g. 'py' for python, NOT '.py'.
1. Wait for the export completed message, then repeat step 3 for other file extensions.
1. The script creates a folder called meta outside of the git repo, if it doesn't exist already. In this folder the output filename contains the name of the repo suffixed by _git_log_output.csv.
1. This script can take a long time to run, for transparency the file being run is printed in the terminal window.
1. The script will print 'export complete' once it's finished.
1. Remove the shell script from the repo to avoid it becoming part of your solution.
