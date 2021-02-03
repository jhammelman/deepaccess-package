mkdir test

#example train from bed file
python src/DeepAccessTrainTransfer.py -beds  data/mm10_trimmed_ASCL1.bed data/mm10_trimmed_CTCF.bed \
       -l ASCL1 CTCF -c ASCL1vsCTCF ASCL1vsNone CTCFvsNone  \
       -ref /archive/gl/shared/genomes/mm10/mm10.fa \
       -g default/mm10.chrom.sizes \
       -out test/ASCL1vsCTCF -nepochs 1 -motifDB default/HMv11_MOUSE.txt

#example run differential per-nucleotide visualization on fasta input
python src/DeepAccessInterpret.py -trainDir test/ASCL1vsCTCF \
       -l ASCL1 CTCF -c ASCL1vsCTCF \
       -fastas data/ASCL1vsCTCF_example.fa -saliency -vis

#example run test motif spacing
python src/DeepAccessInterpret.py -trainDir test/ASCL1vsCTCF \
       -l ASCL1 CTCF -c ASCL1vsCTCF \
       -patternFA data/ASCL1_space.fa 

#example train from fasta
python src/DeepAccessTrainTransfer.py --fasta data/ASCL1vsCTCF_train.fa  \
       -fasta_labels data/ASCL1vsCTCF_train.txt \
       -l ASCL1 CTCF -c ASCL1vsCTCF \
       -ref /archive/gl/shared/genomes/mm10/mm10.fa \
       -g default/mm10.chrom.sizes  \
       -out test/ASCL1vsCTCF_from_fasta -nepochs 1 -motifDB default/HMv11_MOUSE.txt
