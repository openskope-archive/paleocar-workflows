from openskope/feddata

ARG DEBIAN_FRONTEND=noninteractive

RUN echo '***** install R packages needed by PaleoCAR *****'                                        \
 && echo 'install.packages(c("survival"), repos="http://cran.us.r-project.org")'                    \
    > /tmp/install_paleocar_r_dependencies.R                                                        \
 && R --no-save < /tmp/install_paleocar_r_dependencies.R                                            \
                                                                                                    \
 && echo '***** install the bocinsky/paleocar package from GitHub *****'                            \
 && echo 'devtools::install_github("bocinsky/paleocar")' > /tmp/install_paleocar.R                  \
 && R --no-save < /tmp/install_paleocar.R
