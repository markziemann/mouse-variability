SRP=SRP199233
REFDIR=~/projects/inbred_models/ref_old/
featureCounts -Q 30 -T 8 -F SAF -a ${REFDIR}/1e6.bed.saf -o $SRP.1e6.tsv *bam
sed 1d ${SRP}.1e6.tsv | cut -f1,7- > ${SRP}.1e6_fmt.tsv
featureCounts -Q 30 -T 8 -F SAF -a ${REFDIR}/1e5.bed.saf -o $SRP.1e5.tsv *bam
sed 1d ${SRP}.1e5.tsv | cut -f1,7- > ${SRP}.1e5_fmt.tsv
featureCounts -Q 30 -T 8 -F SAF -a ${REFDIR}/1e4.bed.saf -o $SRP.1e4.tsv *bam
sed 1d ${SRP}.1e4.tsv | cut -f1,7- > ${SRP}.1e4_fmt.tsv
featureCounts -Q 30 -T 8 -F SAF -a ${REFDIR}/1e3.bed.saf -o $SRP.1e3.tsv *bam
sed 1d ${SRP}.1e3.tsv | cut -f1,7- > ${SRP}.1e3_fmt.tsv
featureCounts -Q 30 -T 8 -F SAF -a ${REFDIR}/Mus_musculus.GRCm38.98.gtf.exon.saf -o $SRP.genes.tsv *.bam
sed 1d ${SRP}.genes.tsv | cut -f1,7- > ${SRP}.genes_fmt.tsv
