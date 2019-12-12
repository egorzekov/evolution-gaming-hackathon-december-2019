# Evolution Gaming December 2019 Hackathon project

The idea is to implement a Docker container, where it will be easy to reproduce flaky/unstable test, which usually can be reproducible only under high CPU load and in case running 10-20 tests in parallel.

## Usage

To build the image and run the container
```shell script
# 1. clone "js-clients" into this folder

# 2. run and wait
bash build.sh
```

Once the process will be finished, container's terminal will be opened. Examples, what I do further:
```shell script
cd ./some/folder/with/some/flaky/test

# just usefull aliases (will be great to add them to container automatically):
alias test="jest --silent someFlakyTest.spec.tsx"
alias test5="test & test & test & test & test &"

# and finally
test5
```

Running only 4-5 tests in parallel (e.g. `test5` command) should reveal unstable tests. 

Comparing to it, I had to run 4x `yes > /dev/null` and 15-20 parallel `jest --silent someFlakyTest.spec.tsx`' on my Mac to reveal the same problem.