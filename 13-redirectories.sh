#!/bin/bash

LOGS_FOLDER=/"var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%D-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
    echo -e "$R pleae run this script with root privileges $N" &>>$LOG_FILE
    exit 1
    fi
}

VALIDATE(){
    if [$1 -ne 0]
    then
    echo -e "$2 is...$R FAILED $N" &>>$LOG_FILE
    exit 1
    else
    echo -e "$2 is..$G SUCCESS $N" &>>$LOG_FILE
    fi
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install"
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is allready installed..nothing to do"
    fi
done