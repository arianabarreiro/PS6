## Deciphering the role of chromatin remodeling in T cell lineage commitment- Chipseq Analysis

## Overview:
This analysis is part of a bigger study in which we hope to understand better the regulatory interactions that drive lineage commitment in T cells. In particular, we aim to use 3D chromatin interaction data (Hi-C), accessibility studies (DNase-Seq), gene expression (RNA-Seq), and transcription factor occupancy (ChIP-Seq) to propose a set of enhancers that may mediate the regulatory drivers of T cell lineage commitment via chromatin interaction.

## Table of Contents
- [Installation](#installation)
- [Data](#data)
- [Usage](#usage)

## Installation

To analyze all of the data chip-seq datasets and obtain the enriched regions we used SICER. This is primarily a filtering tool designed for ChIP-seq analysis, with two main objectives. Firstly, it delineates significantly ChIP-enriched regions, enabling their association with other genomic features. Secondly, it identifies reads within these enriched regions, facilitating downstream profiling and quantitative analyses. Unlike alternative methods, SICER emphasizes detecting clustered enrichment patterns rather than localized peaks, making it particularly good at discerning enriched regions from diffuse data. 

Install the following instructions [here](https://zanglab.github.io/SICER2/).

Install Rtracker and Ggplot to plot Sicer output in R with the following syntax:

install.packages("ggplot2")
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("rtracklayer")

## Data
Raw chipseq data from GEO(GSE20898). This data was imputed into SICER to obtain peaks.
We run SICER on 4 files that can be downloaded from there:
GSM523221_DN-Gata3
GSM523222_DP-Gata3
GSM661225_DP-CD3hi-WT1
GSM661229_DP-CD3lo-WT1
Output from SICER is a .wig file is located in the folder “results_chipseq” → these were the files(.wig) used to obtain plots of the peaks with R code provided(only uploaded one for proof of concept→ need to identify better what chromosomes we want for final project)
Usage
Obtaining peaks from raw bed data(chipseq):
To obtain the peaks from the publicly available dataset we used version 2 of Sicer. Given that none of the datasets had controls and the availability of Knockout conditions was inconsistent for different cell types we decided to perform the analysis using Scicer without control or knockout commands. Parameters were meticulously optimized to suit our experimental setup and match analysis standards in the field. we set the window size (w) to 200, determining the resolution of our analysis, and the gap size (g) to 400, defining the minimum length of gaps between significant windows for peak merging. These choices ensure robust identification of enriched regions while minimizing false positives. Additionally, parameters such as the redundancy threshold (rt) of 1 and the E-value threshold (e) of 1 were selected to uphold stringent criteria for significance, enhancing the reliability of our findings.

## Example command line:
sicer -t /Users/ariana/Desktop/Data_CHIPSEQ/DP/GSM661229_DP-CD3lo-WT1.bed -s mm8 -w 200 -rt 1 -f 150 -egf 0.74 -g 400 -e 1 -o /Users/ariana/Desktop/Data_CHIPSEQ/results
The first file, labeled as "treatment_file-W200-G600.scoreisland," delineates significant islands controlled by an E-value threshold of 1, following the format "chrom start end score." This file provides a detailed summary of enriched regions, facilitating further investigation into their genomic characteristics and functional implications. The second output, named "treatment_file-W200-normalized.wig," is a .wig file that encapsulates normalized read counts per million, allowing for visualization and interpretation of the identified peaks. Specifically, this file was selected for uploading to the UCSC Genome Browser.

Visualizing output of Scicer- peaks (.R file)
Install the required packages “ggplot” and "rtracklayer”
Run the code in R file.
Can adapt code to select for a specific chromosome or even plot the whole genome
