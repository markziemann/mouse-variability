#!/bin/bash

set -x

PROJ=$(pwd | rev | cut -d '/' -f-2 | tr '/' '\n' | rev | grep RP)
TSV=$PROJ.tsv

SRP=$(echo $TSV | cut -d '.' -f1)

for SRX in $(cut -f2 $TSV | sed 1d | sort -u )  ; do

  #####################################################
  echo Starting $SRX. Downloading data from SRA and converting to fastq.gz
  #####################################################

  rm ${SRX}*fastq

  for SRR in $(grep -w $SRX $TSV | cut -f3 | sort -u) ; do

    prefetch -X 9999G $SRR

    fastq-dump --split-files $SRR

    rm /home/mdz/projects/ncbi/sra/$SRR.sra

    CNT=$(ls ${SRR}*fastq | wc -l)

    if [ $CNT -eq 1 ] ; then

      cat $SRR.fastq >> $SRX.fastq && rm $SRR.fastq

    fi

    if [ $CNT -eq 2 ] ; then

      cat ${SRR}_1.fastq >> ${SRX}_1.fastq && rm ${SRR}_1.fastq

      cat ${SRR}_2.fastq >> ${SRX}_2.fastq && rm ${SRR}_2.fastq

    fi

  done

  pigz -f ${SRX}*.fastq

done
