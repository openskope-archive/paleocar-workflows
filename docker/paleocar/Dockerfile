from ubuntu:xenial-20170119

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