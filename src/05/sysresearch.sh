#!/bin/bash

num_fold=$(sudo find $1* -type d | wc -l)
echo "Total number of folders (including all nested ones) = $num_fold"

echo -e "\e[34m*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *\e[0m"
printf "TOP 5 folders of maximum size arranged in descending order (path and size):\n"
foldname_column="$(sudo du -h $1* | sort -hr | head -5 | awk '{print $2}')"
size_column="$(sudo du -h $1* | sort -hr | head -5 | awk '{print $1}')"
var_fold=($foldname_column)
var_size=($size_column)

for ((i = 0; i < 5; i++)); do
    printf "%d - " "$((i + 1))"
    printf "${var_fold[$i]}/, ${var_size[$i]}B\n"
done
echo -e "\e[34m*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *\e[0m"
echo "Total number of files = $(sudo find $1* -type f | wc -l)"

echo -e "\e[34m*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *\e[0m"
echo "Number of:"
num_conf="$(sudo find $1 -type f -name "*.conf" | wc -l)"
echo "Configuration files (with the .conf extension) = $num_conf"
num_txt=$(sudo find $1* -name "*.txt" | wc -l)
echo "Text files = $num_txt"
num_exec=$(sudo find $1* -executable -type f | wc -l)
echo "Executable files = $num_exec"
num_log=$(sudo find $1* -name "*.log" | wc -l)
echo "Log files (with the extension .log) = $num_log"
num_arch=$(sudo find $1* -name '*.zip' -o \
    -name '*.tar' -o \
    -name '*.tar.gz' -o \
    -name '*.tar.bz2' -o \
    -name '*.tar.xz' -o \
    -name '*.tgz' -o \
    -name '*.tbz2' -o \
    -name '*.7z' -o \
    -name '*.iso' -o \
    -name '*.cpio' -o \
    -name '*.a' -o \
    -name '*.ar' | wc -l)
echo "Archive files = $num_arch"
num_symb_links=$(sudo find $1* -type l | wc -l)
echo "Symbolic links = $num_symb_links"

echo -e "\e[34m*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *\e[0m"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
sorting=$(sudo find $1* -type f -exec du -ch {} + | grep -v total | sort -nr | head -n 10 | sed 's/K/KB/; s/M/MB/; s/G/GB/g')
echo "$sorting" | awk '{
      split($2, arr, ".");
      print NR, "-", $2", "$1", "arr[4]""
    }'

echo -e "\e[34m*   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *   *\e[0m"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 checksums of file)"
sort_files="$(sudo find "$1" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{print $2}')"
sort_file_size="$(sudo find "$1" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -10 | awk '{print $1}' | sed 's/K/KB/; s/M/MB/; s/G/GB/g')"
print_files=($sort_files)
print_size=($sort_file_size)

for ((i = 0; i < 10; i++)); do
    if [[ -z ${print_files[$i]} ]]; then
        break
    fi
    printf "%d - " "$((i + 1))"
    printf "${print_files[$i]}, ${print_size[$i]}, "
    if [[ -n ${print_files[$i]} ]]; then
        checksums="$(md5sum ${print_files[$i]} | awk '{print $1}')"
        printf "$checksums"
    fi
    printf "\n"
done
printf "\n"
