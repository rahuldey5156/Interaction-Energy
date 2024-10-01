#!/bin/bash

#Interaction Energy of membrane (Select the potential energy in the selection option)
gmx energy -f memb.edr -o memb.xvg

###########################################

#Interaction Energy of protein and protein-membrane(Select the potential energy in the selection option)
j=1
while [ $j -lt 10 ]
do
	gmx energy -f "0"$j"_rerun_protein.edr"  -o "0"$j"_protein_potential.xvg"
	gmx energy -f "0"$j"_rerun_protein_memb.edr" -o "0"$j"_protein_memb_potential.xvg"
	let j+=1
done

i=10
while [ $i -lt 26 ]
do
	gmx energy -f $i"_rerun_protein.edr" -o $i"_protein_potential.xvg"
	gmx energy -f $i"_rerun_protein_memb.edr" -o $i"_protein_memb_potential.xvg"
	let i+=1
done
