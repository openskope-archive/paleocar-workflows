#! /usr/bin/env Rscript

library(FedData, quietly=TRUE)

run.dir <- 'plot_vep_elevation_run'
run.label <- 'vepiin'
ned.resolution <- '1'
dir.create(run.dir, showWarnings=FALSE)

# Region to plot is the Village Ecodynamics Project "VEPIIN" study area (http://veparchaeology.org)
ned.xmin <- 672800
ned.xmax <- 740000
ned.ymin <- 4102000
ned.ymax <- 4170000

# @begin plot.vep.elevation
# @in run.dir @in run.label
# @in ned.xmin @in ned.xmax @in ned.ymin @in ned.ymax
# @in ned.resolution
# @out raw.elevation.map.tiles
# @out ned.mosaic.plot
# @out mosaic.elevation.map

# @begin define.region.to.map
# @in ned.xmin @in ned.xmax @in ned.ymin @in ned.ymax
# @out ned.polygon
ned.polygon <- polygon_from_extent(raster::extent(ned.xmin, ned.xmax, ned.ymin, ned.ymax),
                                   proj4string='+proj=utm +datum=NAD83 +zone=12')
# @end define.region.to.map

# @begin get.elevation.map @desc download, mosaic, and crop elevation dataset for the given region
# @in run.label @in run.dir
# @in ned.resolution @in ned.polygon 
# @out mosaic.elevation.raster.layer
# @out raw.elevation.map.tiles @file {run.dir}/raw/ned/{ned.resolution}/n{tile.lat}w{tile.long}.zip
# @out mosaic.elevation.map @file {run.dir}/extracted/{run.label}_ned/{run.label}_NED_{ned.resolution}.tif
ned.raw.dir <- paste0(run.dir, '/raw/ned')
ned.extraction.dir <- paste0(run.dir, '/extracted/', run.label, '_ned')
mosaic.elevation.raster.layer <- get_ned(template=ned.polygon,
                                         label=run.label, 
                                         res=ned.resolution,
                                         raw.dir=ned.raw.dir,
                                         extraction.dir=ned.extraction.dir)
# @end get.elevation.map

# @begin plot.mosaic.elevation.map @desc save a plot of the elevation map 
# @in run.label @in mosaic.elevation.raster.layer 
# @out ned.mosaic.plot @file {run.dir}/{run.label}_ned.pdf
pdf(paste0(run.dir, '/', run.label, '_ned.pdf'))
raster::plot(mosaic.elevation.raster.layer)
# @end plot.mosaic.elevation.map

# @end plot.vep.elevation