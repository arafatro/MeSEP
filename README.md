# MeSEP
Predicting Methylation Site using Sequential Peptide-based Evolutionary PSSM Profiles

## System Diagram
![System Diagram](./System%20Diagram.png)

## STEPS:  
    01. elm to .csv convert:
        Run "Pre-processing.ipynb(.elm to .csv)" with proper function parameters (input is the .elm file downloaded from "http://plmd.biocuckoo.org/download.php"
        Run "Pre-processing.ipynb" with proper and window size (input is the output from previous step)
        > MethylationPositive.txt
        > MethylationnNegative.txt

    02. Get proteins in fasta format:
        Run "ConvertFASTA.py" with proper function parameters (input is the output from previous step)
        > python ConvertFASTA.py myfile.txt result.fasta

    03. CD_HIT to eliminate identical proteins over negative sequence only:
        Run ""run-1595357618.sh" CDHIT (http://weizhong-lab.ucsd.edu/cdhit_suite/cgi-bin/index.cgi?cmd=cd-hit)

    04. Get Unique fasta sequence in different files:
        To get the fasta sequence in different files for getting PSSM

    05. Get All PSSMs
        Run PSSM on the NCBI local blast tool using the "pssm_commands.m" file commands
        > makeblastdb -in sequence.fsa -dbtype prot -parse_seqids -out newdatabase -title "newdb"
        > psiblast -query sequence.fsa -db newdatabase -num_iterations=3 -evalue=0.001 -pseudocount=1 -out psiblastOut.txt -out_ascii_pssm=PSSM -save_each_pssm

    06. Get Total Features
        Run "vectorgenerate.py" to get the features
        
    07. Get the newly curated final dataset

    08. Get Statistics
        Run "MeSEP.py" to get number of Kmeth sites and non-Kmeth sites
