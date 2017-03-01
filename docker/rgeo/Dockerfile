from openskope/gdal

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN echo "***** install R directly from CRAN apt server *****"                                      \
 && echo deb http://cran.rstudio.com/bin/linux/ubuntu xenial/ > /etc/apt/sources.list.d/cran.list   \
 && gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9                                        \
 && gpg -a --export E084DAB9 |  apt-key add -                                                       \
 && apt-get -y update                                                                               \
 && apt-get -y install r-base                                                                       \
                                                                                                    \
 && echo "***** install libproj cartographic projection library *****"                              \
 && apt-get -y install libproj-dev                                                                  \
                                                                                                    \
 && echo "***** install GEOS libraries *****"                                                       \
 && apt-get -y install libgeos-3.5.0 libgeos-dev                                                    \
                                                                                                    \
&& echo "***** install netcdf and netcdf development libraries *****"                               \
 && apt-get -y install netcdf-bin libnetcdf-dev                                                     \
                                                                                                    \
 && echo '***** install R packages for geospatial computing *****'                                  \
 && echo 'install.packages(c("rgdal", "rgeos", "raster", "ncdf4", "magrittr"), repos="http://cran.us.r-project.org")'  \
    > /tmp/install_geospatial_r_packages.R                                                          \
 && R --no-save < /tmp/install_geospatial_r_packages.R

USER nobody

CMD echo "Usage: docker run openskope/rgeospatial RScript <r-script-file> [r-script-arguments]"