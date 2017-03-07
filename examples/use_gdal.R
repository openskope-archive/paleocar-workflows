#! /usr/bin/env Rscript

library(rgdal)
library(optparse)

# parse the command-line options
options_list = list(optparse::make_option(c("--filename"), type = "character"))
opt_parser = optparse::OptionParser(option_list = options_list);
options =  optparse::parse_args(opt_parser);

# print the name of the image file
cat('\n', 'Image file:    ' , options$filename, '\n')

# load a GDAL dataset from the image file
dataset <- GDAL.open(options$filename)

# get the matrix of values in the dataset
dataMatrix <- getRasterData(dataset)

# display the pixel values in the data set
cat('\n', 'Pixel values:', '\n\n')
print(dataMatrix)




