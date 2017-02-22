from openskope/gdal

ARG DEBIAN_FRONTEND=noninteractive

RUN echo '***** update apt packages and install apt utilities *****'                                \
 && apt-get -y update                                                                               \
 && apt-get -y install -y apt-utils
                                                                                                    \
RUN echo '***** install curl and ssl development libraries *****'                                   \
 && apt-get -y install libcurl4-openssl-dev libssl-dev                                              \
 && echo "***** install netcdf and netcdf development libraries *****"                              \
 && apt-get -y install netcdf-bin libnetcdf-dev                                                     \
 && echo "***** install libproj cartographic projection library *****"                              \
 && apt-get -y install libproj-dev                                                                  \
 && echo "***** install GEOS and GEOS development libraries *****"                                  \
 && apt-get -y install libgeos-3.5.0 libgeos-dev                                                    \
 && echo "***** install libxml development package *****"                                           \
 && apt-get -y install libxml2-dev

RUN echo "***** install R directly from CRAN apt server *****"                                      \
 && echo deb http://cran.rstudio.com/bin/linux/ubuntu xenial/ > /etc/apt/sources.list.d/cran.list   \
 && gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9                                        \
 && gpg -a --export E084DAB9 |  apt-key add -                                                       \
 && apt-get -y update                                                                               \
 && apt-get -y install r-base

RUN echo '***** install R packages needed by PaleoCAR *****'                                        \
 && export PATH=$PATH:/opt/gdal/gdal-2.1.2/bin/                                                     \
 && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/gdal/gdal-2.1.2/lib/                               \
 && echo 'install.packages(c("rgdal", "survival", "devtools"), repos="http://cran.us.r-project.org")'\
    > /tmp/packages.R                                                                               \
 && R --no-save < /tmp/packages.R

RUN echo 'devtools::install_github("bocinsky/paleocar")' > /tmp/install_paleocar.R                  \
 && R --no-save < /tmp/install_paleocar.R
