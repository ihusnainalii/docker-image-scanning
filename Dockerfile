FROM ubuntu:18.04 

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    python2.7 \
    openssl \
    && apt-get clean

COPY vulnerable_app.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/vulnerable_app.sh

CMD ["/bin/bash"]
