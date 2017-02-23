from openskope/gdal

ARG DEBIAN_FRONTEND=noninteractive

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
 && echo '***** install R packages for geospatial computing *****'                                  \
 && export PATH=$PATH:/opt/gdal/gdal-2.1.2/bin/                                                     \
 && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/gdal/gdal-2.1.2/lib/                               \
 && echo 'install.packages(c("rgdal"), repos="http://cran.us.r-project.org")'                       \
    > /tmp/install_rgdal.R                                                                          \
 && R --no-save < /tmp/install_rgdal.R
