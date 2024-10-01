Interaction energy is the contribution to the total energy that is caused by an interaction between the objects being considered.
It can be calculated either for an entire protein or by dividing the protein into small domains containing residues or for each residues.

########

Step 1. Run the index.sh script to make index files from pdb
Step 2. Run the rerun.sh script to get the edr files
Step 3. Run the energy.sh script to get the xvg files

#########

We studied the interaction energy between protein residues and membrane. So we had an xvg file for membrane, xvg files for each residue of the protein and xvg files for
each residue + membrane.

Hence, from here we can get the Interaction Energy using the formula,
Interaction Energy = Potential energy of protein-membrane - (Potential energy of protein + Potential energy of membrane)

Step 4. To get the interaction energy for each frame, run the script Interaction Energy.ipynb, or to get the mean interaction energy, run the script Mean Interaction Energy.ipynb

###########

Note: The values are in Joule/mol. To convert it to KCal/mol, divide it by 4200
