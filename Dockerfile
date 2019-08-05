FROM selenium/node-chrome-debug:latest
LABEL authors=patrikpihlstrom

USER root
RUN apt-get -y update
RUN apt-get -y install software-properties-common wget git
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get -y install python3.7 python3-pip

# Install anna
USER seluser
RUN pip3 install urllib3
RUN git config --global user.name "anna-chrome" && git config --global user.email "patrik.pihlstrom@gmail.com"
RUN git clone https://github.com/patrikpihlstrom/anna.git ~/anna
RUN cd ~/anna && pip3 install .
RUN echo 'alias anna="python3 /home/seluser/anna/anna/__main__.py"' >> ~/.bashrc
