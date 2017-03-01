from openskope/feddata

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN echo '***** install the bocinsky/paleocar package from GitHub *****'                            \
 && echo 'devtools::install_github("bocinsky/paleocar")' > /tmp/install_paleocar.R                  \
 && R --no-save < /tmp/install_paleocar.R

USER nobody

CMD echo "Usage: docker run openskope/paleocar Rscript <r-script-using-paleocar> [r-script-arguments]"