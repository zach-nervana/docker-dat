FROM node
MAINTAINER Andrew Lawson <http://adlawson.com>

ADD ./start /bin/start

VOLUME ["/data"]

ENV SHELL /bin/bash

# ENTRYPOINT ["/bin/start", "/data"]
ENTRYPOINT ["/bin/bash"]
CMD []

EXPOSE 6461
RUN npm install -g dat
