FROM alpine:latest

MAINTAINER Yusu Pan <xxdsox@gmail.com>

ARG ANT_VERSION="1.9.8"

# create ant dir
RUN mkdir -p /opt/ant/
# download ant
RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz -P /opt/ant
# unpack ant
RUN tar -xvzf /opt/ant/apache-ant-${ANT_VERSION}-bin.tar.gz -C /opt/ant/
# remove tar file
RUN rm -f /opt/ant/apache-ant-${ANT_VERSION}-bin.tar.gz

# setting ant home
ENV ANT_HOME=/opt/ant/apache-ant-${ANT_VERSION}
# setting ant parameters
ENV ANT_OPTS="-Xms256M -Xmx512M"
# updating path
ENV PATH="${PATH}:${HOME}/bin:${ANT_HOME}/bin"

# install JDK 1.8
RUN apk --update add openjdk8
# install git
RUN apk --update add git
# install fonts
RUN apk --update add font-noto

# clone GameController
RUN git clone https://github.com/RoboCup-Humanoid-TC/GameController.git
WORKDIR GameController
# building from source
RUN ant
WORKDIR build/jar
# set entrypoint
COPY entrypoint.sh .
# CMD sh -c "java -jar GameController.jar -l hl_kid"
ENTRYPOINT ["/GameController/build/jar/entrypoint.sh"]
