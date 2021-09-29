#!/bin/bash

REF=../../ref/Mus_musculus.GRCm39.dna_sm.toplevel.fa

for BAM in $(ls *bam | egrep -v '(dis|split)') ; do

  BASE=$(echo $BAM | sed 's/.bam//')

  ExpansionHunterDenovo profile --reads $BAM \
  --reference $REF \
  --output-prefix $BASE --min-anchor-mapq 50 --max-irr-mapq 40

done

ExpansionHunterDenovo merge \
  --reference $REF \
  --manifest manifest.tsv \
  --output-prefix SRP199233_merge

casecontrol.py locus \
  --manifest manifest.tsv \
  --multisample-profile SRP199233_merge.multisample_profile.json \
  --output SRP199233_dataset.casecontrol_locus.tsv

outlier.py locus \
        --manifest manifest.tsv \
        --multisample-profile SRP199233_merge.multisample_profile.json \
        --output SRP199233_merge.outlier_locus.tsv
