from openskope/rgdal

ARG DEBIAN_FRONTEND=noninteractive

RUN echo '***** install curl and ssl development libraries needed by devtools *****'                \
 && apt-get -y install libcurl4-openssl-dev libssl-dev                                              \
 && echo "***** install netcdf and netcdf development libraries *****"                              \
 && apt-get -y install netcdf-bin libnetcdf-dev                                                     \
 && echo "***** install libxml development package *****"                                           \
 && apt-get -y install libxml2-dev

RUN echo '***** install R packages needed by PaleoCAR *****'                                        \
 && echo 'install.packages(c("devtools", "survival"), repos="http://cran.us.r-project.org")'         \
    > /tmp/install_paleocar_r_dependencies.R                                                                \
 && R --no-save < /tmp/install_paleocar_r_dependencies.R

RUN echo 'devtools::install_github("bocinsky/paleocar")' > /tmp/install_paleocar.R                  \
 && R --no-save < /tmp/install_paleocar.R
