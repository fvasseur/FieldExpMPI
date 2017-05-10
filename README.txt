We want to analyse Illumina HiSeq data from pooled samples of Arabidopsis thaliana collected in 2016 in three experimental plots at MPI-Tuebingen.

In total there are 451 accessions that have been sown in 2014. The progeny (2nd generation) has been harvested in 2016 (pools of flower heads of ca 50-200 individuals from each plot). 
Description of the samples with IDs is available in Table_IDseq.

We start with a series of fastq files that we want to proceed for mapping to the reference, filtering bad quality, SNP calling and SNP filtering.
Data are available at: http://ftp.tuebingen.mpg.de/pub/ebio/beth/francoisfield/

In this first analysis, I processed three samples (S7, S8 and S9) to map SNPs with the following code:

$ skewer -m pe -t 10 /data_input/francoisfield_S9_L005_R1_001.fastq.gz /data_input/francoisfield_S9_L005_R2_001.fastq.gz

$ bwa mem /index/TAIR10_chr_all.fas /data_output/S9/francoisfield_S9_L005_R1_001.fastq-trimmed-pair1.fastq /data_output/S9/francoisfield_S9_L005_R1_001.fastq-trimmed-pair2.fastq  > FieldExp_S9.sam

$ samtools view -S -b  FieldExp_S9.sam >  FieldExp_S9.bam
$ samtools sort FieldExp_S9.bam FieldExp_S9.sorted
$ samtools index FieldExp_S9.sorted.bam

$ freebayes -f /data_input/index/TAIR10_chr_all.fas /data_output/S9/FieldExp_S9.sorted.bam > FieldExp_S9.freebayes.vcf

