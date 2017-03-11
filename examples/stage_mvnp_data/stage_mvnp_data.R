#! /usr/bin/env Rscript

library(FedData, quietly=TRUE)

run.dir <- './stage_mvnp_data_run'
raw.data.dir <- paste0(run.dir, '/raw')
staged.data.dir <- paste0(run.dir, '/staged')
dir.create(raw.data.dir, showWarnings=FALSE, recursive=TRUE)
dir.create(staged.data.dir, showWarnings=FALSE, recursive=TRUE)

raw.mvnp.data.dir <- paste0(raw.data.dir, '/mvnp')
staged.mvnp.data.dir <- paste0(staged.data.dir, '/mvnp')
dir.create(raw.mvnp.data.dir, showWarnings=FALSE, recursive=TRUE)
dir.create(staged.mvnp.data.dir, showWarnings=FALSE, recursive=TRUE)

FedData::download_data("http://nrdata.nps.gov/programs/Lands/meve_tracts.zip", destdir=raw.mvnp.data.dir)
utils::unzip("./data-raw/MVNP/meve_tracts.zip", exdir="./data-raw/MVNP/meve_tracts")
mvnp <- rgdal::readOGR("./data-raw/MVNP/meve_tracts", layer='MEVE_boundary')

rgdal::writeOGR(mvnp, dsn = "./data-raw/", layer = "mvnp", driver = "ESRI Shapefile", overwrite_layer = TRUE)

devtools::use_data(mvnp, overwrite = TRUE