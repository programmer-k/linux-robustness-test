# linux-robustness-test
Linux Kernel Robustness Test Scripts

This repository contains the bash scripts for automating Linux kernel robustness tests.
It firstly checks whether the required executables exist and run them.

# run_end.sh
This script runs the testcases that end in a short amount of time and do not make kernel panic.
Please use the following command to run it.

```
curl -s https://raw.githubusercontent.com/programmer-k/linux-robustness-test/main/run_end.sh | bash | tee run_end_output.txt

# If you want to modify the array declared in the script,
# Please use the following commands.
curl -s https://raw.githubusercontent.com/programmer-k/linux-robustness-test/main/run_end.sh -o run_end.sh
nano run_end.sh     # Use the text editor whatever you want.
bash run_end.sh | tee run_end_output.txt
```

# run_no_end.sh
This script runs the testcases that does not end in a short amount of time and do not make kernel panic.
I set the timeout value as 15 minutes so each executable will be stopped after 15 minutes.
Thus, it will take some time to run it.
Please use the following command to run it.

```
curl -s https://raw.githubusercontent.com/programmer-k/linux-robustness-test/main/run_no_end.sh | bash | tee run_no_end_output.txt

# If you want to modify the array declared in the script,
# Please use the following commands.
curl -s https://raw.githubusercontent.com/programmer-k/linux-robustness-test/main/run_no_end.sh -o run_no_end.sh
nano run_no_end.sh     # Use the text editor whatever you want.
bash run_no_end.sh | tee run_no_end_output.txt
```

# Testcases that result in kernel panic
Please run by it yourself since it is quite difficult to automate it.
