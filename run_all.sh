#/usr/bin/env bash

testcases=*.exe

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
    timeout --signal=KILL 3s ./${filename}
done

echo "All programs finished!"