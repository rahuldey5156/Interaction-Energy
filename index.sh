#!/bin/bash

i=0

while [ $i -lt 25 ]
do
	gmx make_ndx -f protein.gro -o $(($i+1)).ndx
	let i+=1
done
