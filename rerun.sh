#!/bin/bash

#For membrane only

gmx convert-tpr -s step6.6_equilibration.tpr -n "0"$i.ndx -o rerun_memb.tpr
gmx trjconv -f trans_final.xtc -n "0"$i.ndx -s step6.6_equilibration.tpr -o memb.xtc
gmx mdrun -rerun memb.xtc -v -deffnm rerun_memb
rm memb.xtc

###############################################

#For protein and protein-membrane

j=1
while [ $j -lt 10 ]
do

        echo "26" | gmx convert-tpr -s step6.6_equilibration.tpr -n "0"$j.ndx -o "0"$j"_rerun_protein.tpr"
        echo "27" | gmx convert-tpr -s step6.6_equilibration.tpr -n "0"$j.ndx -o "0"$j"_rerun_protein_memb.tpr"

        echo "26" | gmx trjconv -f trans_final.xtc -n "0"$j.ndx -s step6.6_equilibration.tpr -o "0"$j"_protein.xtc"
        echo "27" | gmx trjconv -f trans_final.xtc -n "0"$j.ndx -s step6.6_equilibration.tpr -o "0"$j"_protein_memb.xtc"

	gmx mdrun -rerun "0"$j"_protein.xtc" -v -deffnm "0"$j"_rerun_protein"
	gmx mdrun -rerun "0"$j"_protein_memb.xtc" -v -deffnm "0"$j"_rerun_protein_memb"

	rm "0"$j"_protein.xtc"
	rm "0"$j"_protein_memb.xtc"

	let j+=1
done

i=10
while [ $i -lt 26 ]
do

	echo "26" | gmx convert-tpr -s step6.6_equilibration.tpr -n $i.ndx -o $i"_rerun_protein.tpr"
	echo "27" | gmx convert-tpr -s step6.6_equilibration.tpr -n $i.ndx -o $i"_rerun_protein_memb.tpr"

	echo "26" | gmx trjconv -f trans_final.xtc -n $i.ndx -s step6.6_equilibration.tpr -o $i"_protein.xtc"
	echo "27" | gmx trjconv -f trans_final.xtc -n $i.ndx -s step6.6_equilibration.tpr -o $i"_protein_memb.xtc"

	gmx mdrun -rerun $i"_protein.xtc" -v -deffnm $i"_rerun_protein"
	gmx mdrun -rerun $i"_protein_memb.xtc" -v -deffnm $i"_rerun_protein_memb"

	rm $i"_protein.xtc"
        rm $i"_protein_memb.xtc"
	
	let i+=1
done
