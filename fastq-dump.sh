#!/bin/bash

for id in `cut -f 1 idlist2.txt|sort|uniq`
do

echo “prefetch ${id}...”
prefetch -v ${id}
sra_file=$( srapath ${id} )

echo “Dumping reads for ${id}...”
fastq-dump -O ./fastq --skip-technical -I -R pass --dumpbase --split-3 --clip ${sra_file}

done
done