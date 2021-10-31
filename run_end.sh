#/usr/bin/env bash

testcases=("inode.exe" "jiun4.exe" "jjhTest1.exe" "test3.exe" "test4.exe" "test5.exe" "test.exe" "testac056.exe" "testcase1.exe" "testcase3.exe" "testcase5.exe" "testcase6.exe")

echo "This script will run all the testcases that should be end in a short period of time."
echo "If not, please check the result and report/fix the kernel."
echo ""

echo "Checking whether all the executables exist.."

for filename in ${testcases[@]}; do
    echo "Checking whether ${filename} exists.." 
    if ! test -x ${filename}; then
        echo "File ${filename} does not exist!"
        echo "Aborting.."
        exit 1
    fi
done

echo "All files exist!"
echo ""

echo "Now, the script will run each executable without any timeout."
echo "If the program does not end or invokes kernel panic, please fix it."

for filename in ${testcases[@]}; do
    echo "Running ${filename}.."
    ./${filename}
done

echo "All programs finished!"
