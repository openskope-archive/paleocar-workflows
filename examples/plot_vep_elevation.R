#! /usr/bin/env Rscript

library(FedData)

# Extract data for the Village Ecodynamics Project "VEPIIN" study area:
# http://veparchaeology.org
vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000),
                                  proj4string='+proj=utm +datum=NAD83 +zone=12')

run.label = 'vepiin'
run.base <- 'plot_vep_elevation_run'
ned.resolution <- '1'
ned.raw.dir <- paste0(run.base, '/raw/', 'ned')
ned.extraction.dir <- paste0(run.base, '/extracted/', run.label, 'ned')

ned <- get_ned(template=vepPolygon,
               label=run.label, 
               res=ned.resolution,
               raw.dir=ned.raw.dir,
               extraction.dir=ned.extraction.dir
)

ned.plot.filename <- paste0(run.base, '/', run.label, '_ned.pdf')
pdf(ned.plot.filename)
raster::plot(ned)