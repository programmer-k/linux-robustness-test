#/usr/bin/env bash

testcases=("example.exe" "jhh1.exe" "js2.exe" "nssh1.exe" "swtest12.exe" "test1.exe" "test1_0601p.exe" "test2.exe" "testcase2.exe" "testcase8.exe")

echo "This script will run all the testcases that should not end but also should not result in kernel panic."
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

echo "Now, the script will run each executables with timeout of 15 minutes."
echo "If the program does end or invokes kernel panic, please fix it."

for filename in ${testcases[@]}; do
    echo "Running ${filename}.."
    timeout --signal=KILL --kill-after=15m ./${filename}
done

echo "All programs finished!"
