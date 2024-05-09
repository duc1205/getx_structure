1. Remove the cache of all the files

git rm -r --cached .

2. Remove the cache of specific file

git rm -r --cached <file_name.ext>

3. Once you clear the existing cache, add/stage file/files in the current directory and commit

git add . // To add all the files
git add <file_name.ext> // To add specific file
git commit -m "Suitable Message"