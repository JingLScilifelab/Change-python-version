#!/bin/bash

for peaks in *.narrowPeak
do 

cut -f 1-5 $peaks |awk '{print $0"\t+"}'> plus_cut/$peaks

done

