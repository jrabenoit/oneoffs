#!/bin/bash

for f in *;
do
	fsl5.0-cluster --in=$f --thresh=0.5 -o ${f%%.*}'-clustermask';
done

