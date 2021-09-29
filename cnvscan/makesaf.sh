#!/bin/bash

bedtools makewindows -g Mus_musculus.GRCm38.dna_sm.toplevel.fa.g -w 1000 > 1e3.bed
bedtools makewindows -g Mus_musculus.GRCm38.dna_sm.toplevel.fa.g -w 10000 > 1e4.bed
bedtools makewindows -g Mus_musculus.GRCm38.dna_sm.toplevel.fa.g -w 100000 > 1e5.bed
bedtools makewindows -g Mus_musculus.GRCm38.dna_sm.toplevel.fa.g -w 1000000 > 1e6.bed

awk '{OFS="\t"} { print $1":"$2"-"$3,$0,"+"  }' 1e3.bed > 1e3.bed.saf
awk '{OFS="\t"} { print $1":"$2"-"$3,$0,"+"  }' 1e4.bed > 1e4.bed.saf
awk '{OFS="\t"} { print $1":"$2"-"$3,$0,"+"  }' 1e5.bed > 1e5.bed.saf
awk '{OFS="\t"} { print $1":"$2"-"$3,$0,"+"  }' 1e6.bed > 1e6.bed.saf



grep -w gene Mus_musculus.GRCm38.98.gtf \
| cut -d '"' -f-2,6 | cut -f1,4,5,9 \
| sed 's/gene_id "//' \
| tr '"' '_' > Mus_musculus.GRCm38.98.gtf.bed

awk '{OFS="\t"} { print $4,$1,$2,$3  }' Mus_musculus.GRCm38.98.gtf.bed > Mus_musculus.GRCm38.98.gtf.saf

