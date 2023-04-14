#!/bin/bash

if [ $# -eq 0 ]
  then
    if ! test -f "main"; then
        make
    fi
    echo "Testing all test cases"
    echo "======================"

    ./main --input=test_0.java
    if [ $? -eq 0 ]; then
        echo "test_1.java passed"
    else
        echo "test_1.java failed"
    fi

    ./main --input=test_1.java
    if [ $? -eq 0 ]; then
        echo "test_1.java passed"
    else
        echo "test_1.java failed"
    fi

    ./main --input=test_2.java
    if [ $? -eq 0 ]; then
        echo "test_2.java passed"
    else
        echo "test_2.java failed"
    fi

    ./main --input=test_3.java
    if [ $? -eq 0 ]; then
        echo "test_3.java passed"
    else
        echo "test_3.java failed"
    fi

    ./main --input=test_4.java
    if [ $? -eq 0 ]; then
        echo "test_4.java passed"
    else
        echo "test_4.java failed"
    fi

    ./main --input=test_5.java
    if [ $? -eq 0 ]; then
        echo "test_5.java passed"
    else
        echo "test_5.java failed"
    fi

    ./main --input=test_6.java
    if [ $? -eq 0 ]; then
        echo "test_6.java passed"
    else
        echo "test_6.java failed"
    fi

    ./main --input=test_7.java
    if [ $? -eq 0 ]; then
        echo "test_7.java passed"
    else
        echo "test_7.java failed"
    fi

    ./main --input=test_8.java
    if [ $? -eq 0 ]; then
        echo "test_8.java passed"
    else
        echo "test_8.java failed"
    fi

    ./main --input=test_9.java
    if [ $? -eq 0 ]; then
        echo "test_9.java passed"
    else
        echo "test_9.java failed"
    fi

    ./main --input=test_10.java
    if [ $? -eq 0 ]; then
        echo "test_10.java passed"
    else
        echo "test_10.java failed"
    fi

    ./main --input=test_11.java
    if [ $? -eq 0 ]; then
        echo "test_11.java passed"
    else
        echo "test_11.java failed"
    fi

    ./main --input=test_12.java
    if [ $? -eq 0 ]; then
        echo "test_12.java passed"
    else
        echo "test_12.java failed"
    fi

    ./main --input=test_13.java
    if [ $? -eq 0 ]; then
        echo "test_13.java passed"
    else
        echo "test_13.java failed"
    fi

else
    if ! test -f "main"; then
        make
    fi
    ./main --input=test_$1.java
    if [ $? -eq 0 ]; then
        echo "test_$1.java passed"
    else
        echo "test_$1.java failed"
    fi
fi