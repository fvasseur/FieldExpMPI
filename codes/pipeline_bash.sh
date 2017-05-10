#!/bin/bash

skewer -m pe -t 10 /data_input/francoisfield_S9_L005_R1_001.fastq.gz /data_input/francoisfield_S9_L005_R2_001.fastq.gz

bwa mem /index/TAIR10_chr_all.fas /data_output/S9/francoisfield_S9_L005_R1_001.fastq-trimmed-pair1.fastq /data_output/S9/francoisfield_S9_L005_R1_001.fastq-trimmed-pair2.fastq  > FieldExp_S9.sam

samtools view -S -b  FieldExp_S9.sam >  FieldExp_S9.bam
samtools sort FieldExp_S9.bam FieldExp_S9.sorted
samtools index FieldExp_S9.sorted.bam

freebayes -f /data_input/index/TAIR10_chr_all.fas /data_output/S9/FieldExp_S9.sorted.bam > FieldExp_S9.freebayes.vcf

