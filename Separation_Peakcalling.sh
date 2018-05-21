#!/bin/bash

for ssDNA in `cut -f 1 ssDNA_1.txt|sort|uniq`

do

#separate forward strands

echo “samtools view -b -f 64 -F 20 ${ssDNA}.bam”

samtools view -b -f 64 -F 20 ${ssDNA}.bam > ../plus/${ssDNA}.plus.bam 

samtools index ../plus/${ssDNA}.plus.bam 


#separate reverse strands

echo “samtools view -b -f 80 ${ssDNA}.bam”

samtools view -b -f 80 ${ssDNA}.bam > ../minus/${ssDNA}.minus.bam

samtools index ../minus/${ssDNA}.minus.bam #build index


#peak calling for forward strands

echo “macs2 callpeak -t ../plus/${ssDNA}.plus.bam -g mm -n $ssDNA.peaks_plus --outdir ../peaks_plus --nomodel -p 1e-3 -m 20 100”

macs2 callpeak -t ../plus/${ssDNA}.plus.bam -g mm -n $ssDNA.peaks_plus --outdir ../peaks_plus --nomodel -p 1e-3 -m 20 100

#peak calling for reverse strands

echo “macs2 callpeak -t ../minus/${ssDNA}.minus.bam -g mm -n $ssDNA.peaks_minus --outdir ../peaks_minus --nomodel -p 1e-3 -m 20 100”

macs2 callpeak -t ../minus/${ssDNA}.minus.bam -g mm -n $ssDNA.peaks_minus --outdir ../peaks_minus --nomodel -p 1e-3 -m 20 100

done
done
