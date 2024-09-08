#!/bin/bash

NUMBBER+$1

if [ $NUMBER -gt 20 ] #gt(GReater),lt(Lessthan),eq(equal),-ne(not equal)
then
    echo "Given numbber: $NUMBER is greater than 20"
else
    echo "Given numbber: $NUMBER is less than 20"
fi
