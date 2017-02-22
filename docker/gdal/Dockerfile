from ubuntu:xenial-20170119

ARG DEBIAN_FRONTEND=noninteractive
 
RUN echo '***** update apt packages and install utilities *****'                                    \
 && apt-get -y update                                                                               \
 && apt-get -y install -y apt-utils                                                                 \
 && apt-get -y install wget tree                                                                    \
 && echo '***** Install Python2, Python3, and pip for both *****'                                   \
 && apt-get -y install python python-pip python3 python3-pip                                        \
 && pip2 install --upgrade pip                                                                      \
 && pip3 install --upgrade pip                                                                      \
 && echo '***** install numpy package for both Python2 and Python3'                                 \
 && pip2 install numpy                                                                              \
 && pip3 install numpy

RUN echo '***** download source package for GDAL 2.1.2 *****'                                       \
 && mkdir builds                                                                                    \
 && cd builds                                                                                       \
 && wget http://download.osgeo.org/gdal/2.1.2/gdal-2.1.2.tar.gz                                     \
 && gunzip gdal-2.1.2.tar.gz                                                                        \
 && tar -xvvf gdal-2.1.2.tar

RUN echo '***** configure and build GDAL with Python2 bindings ******'                              \
 && mkdir -p /opt/gdal                                                                              \
 && cd builds/gdal-2.1.2                                                                            \
 && ./configure --prefix /opt/gdal/gdal-2.1.2 --with-python=$(which python2)                        \
 && make install                                                                                    \
 && echo '***** then reconfigure and rebuild for Python3 bindings *****'                            \
 && ./configure --prefix /opt/gdal/gdal-2.1.2 --with-python=$(which python3)                        \
 && make install

RUN echo '***** configure image for running GDAL with Python2 bindings *****'                       \
 && echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/gdal/gdal-2.1.2/lib/" >> ~/.bashrc           \
 && echo "export PATH=$PATH:/opt/gdal/gdal-2.1.2/bin/" >> ~/.bashrc                                 \
 && echo "export PYTHONPATH=/opt/gdal/gdal-2.1.2/lib/python2.7/site-packages/" >> ~/.bashrc
