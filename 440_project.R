
# install ggplot2
install.packages("ggplot2")

# install rtracklayer
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("rtracklayer")

#load libraries
library(rtracklayer)
library(ggplot2)

# Set the path to the .wig file
wig_file <- "/Users/ariana/Desktop/myfolder/results/GSM523221_DN-Gata3-W200-normalized.wig"

# Import the .wig file
wig_data <- import(wig_file)

# Convert to GRanges object
gr <- as(wig_data, "GRanges")

# Convert GRanges object to data frame
wig_df <- as.data.frame(gr)

# Plot the peaks
#ggplot(data = wig_df) +
  #geom_bar(aes(x = start, y = score), stat = "identity") +
  #labs(x = "Genomic Position", y = "Score", title = "Peaks from Chip-Seq Data")

# Convert seqnames to character vector
chromosome_names <- as.character(seqnames(gr))

# Filter data for chromosome 17
chromosome_17_df <- wig_df[chromosome_names == "chr17", ]

# Plot the peaks for chromosome 17
ggplot(data = chromosome_17_df) +
  geom_bar(aes(x = start, y = score), stat = "identity") +
  labs(x = "Genomic Position", y = "Score", title = "Peaks from Chip-Seq Data on Chromosome 17")



