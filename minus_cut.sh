#!/bin/bash

for peaks in *.narrowPeak
do 

cut -f 1-5 $peaks |awk '{print $0"\t-"}'> minus_cut/$peaks

done

