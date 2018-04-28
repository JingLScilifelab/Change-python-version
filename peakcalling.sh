#!/bin/bash

for IP in `cut -f 1 IP_Cont.txt|sort|uniq`
do

for CON in `cat IP_Cont.txt|awk -v a=${IP} '{if ($1==a) print $2}'`
do

echo “macs2 callpeak -t bam/${IP}.bam -c bam/${CON}.bam -g mm -n $IP --outdir ./peak1 -B -p 0.05 ”
macs2 callpeak -t bam/${IP}.bam -c bam/${CON}.bam -g mm -n $IP --outdir ./peaks -B -p 0.05

done
done