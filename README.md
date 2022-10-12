# MeSEP
MeSEP: Computational Prediction of Lysine Methylation Site using Sequential Evolutionary and Structural Feature Information

## System Diagram
![System Diagram](./System%20Diagram.png)

## STEPS:
    To run the model, you are requested to thorughly follow the listed steps:
    01. Convert elm to .csv:
        Run "Pre-processing.ipynb(.elm to .csv)" with proper function parameters (input is the .elm file downloaded from "http://plmd.biocuckoo.org/download.php"
        Extract the sequences with proper window size to get-
        > MethylationPositive.txt
        > MethylationnNegative.txt

    02. Get proteins in fasta format:
        Run "ConvertFASTA.py" with proper function parameters (input is the output from previous step)
        > python ConvertFASTA.py myfile.txt result.fasta

    03. CD_HIT to eliminate identical proteins over negative sequence only:
        Run "run-1595357618.sh" CDHIT (http://weizhong-lab.ucsd.edu/cdhit_suite/cgi-bin/index.cgi?cmd=cd-hit)
	To get the fasta sequence in different files for getting PSSM

    04. Get All PSSMs
        Run PSSM on the NCBI local blast tool using the "pssm_commands.m" file commands
        > makeblastdb -in sequence.fsa -dbtype prot -parse_seqids -out newdatabase -title "newdb"
        > psiblast -query sequence.fsa -db newdatabase -num_iterations=3 -evalue=0.001 -pseudocount=1 -out psiblastOut.txt -out_ascii_pssm=PSSM -save_each_pssm

    05. Get All SPD3
	# By given protein sequences in fasta format, you can run command
	> ../misc/run_local.sh *.seq
	to obtain predicted secondary structure, ASA, backbone torsion angles.
	## If you already have pssm files for your proteins.
	> ../misc/pred_pssm.py *.pssm
	The output will be seen in *.spd3    
    
    06. Get Total Features
        Run "vectorgenerate.py" to get the total features

    07. Get Model Performance Statistics
        Run "MeSEP.py" to get number of Kmeth sites and non-Kmeth sites
