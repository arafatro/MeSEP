system('C:','-echo');
system('cd C:\Program Files\NCBI\blast-2.7.1+\db','-echo');
system('makeblastdb -in sequence.fsa -dbtype prot -parse_seqids -out newdatabase -title "newdb"','-echo');
system('psiblast -query sequence.fsa -db newdatabase -num_iterations=3 -evalue=0.001 -pseudocount=1 -out psiblastOut.txt -out_ascii_pssm=PSSM -save_each_pssm','-echo');




Command 1: makeblastdb -in sequence.fsa -dbtype prot -parse_seqids -out newdatabase -title "newdb"


Common 2:  psiblast -query sequence.fsa -db newdatabase -num_iterations=3 -evalue=0.001 -pseudocount=1 -out psiblastOut.txt -out_ascii_pssm=PSSM -save_each_pssm