FROM selenium/node-chrome-debug:3.141.59-fluorine
LABEL authors=patrikpihlstrom

USER root
RUN apt-get -y update
RUN apt-get -y install wget
RUN apt-get -y install python
RUN apt-get -y install python-pip

# install anna
RUN wget -qO- https://github.com/patrikpihlstrom/anna/archive/1.0.5.tar.gz| tar xvz
RUN cd anna-1.0.5 && python setup.py install
RUN ln -s /anna-1.0.5/anna/__main__.py /usr/local/bin/anna 
