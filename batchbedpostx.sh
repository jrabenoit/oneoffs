#!/bin/bash

for D in *;
do (cd $D && /home/james/bedpostxconveyor.sh);
done
