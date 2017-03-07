#! /usr/bin/env python2

import argparse
from osgeo import gdal
from gdalconst import GA_ReadOnly

# parse the command line arguments
parser = argparse.ArgumentParser()
parser.add_argument('filename', help='file to probe')
args = parser.parse_args()

# echo back the first argument
print("Image file:       {}".format(args.filename))

# open the file as a GDAL data set
dataset = gdal.Open(args.filename, GA_ReadOnly)

# print some properties of the data set
print("Driver:           {}".format(dataset.GetDriver().LongName))
print("Extent in pixels: {} x {} ".format(dataset.RasterXSize, dataset.RasterYSize))
print("Number of bands:  {}".format(dataset.RasterCount))