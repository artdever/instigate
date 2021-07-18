#!/bin/bash

# loop a folder recusively,
print_folder_recurse() {
    for file in "$1"/*;do
        if [ -d "$file" ];then
#            echo "dir: $file"
            print_folder_recurse "$file"
        elif [ -f "$file" ]; then
            echo "file: $file"
			bash ./isAccess.sh $file
        fi
    done
}


print_folder_recurse $1
