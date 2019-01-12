FROM ndegardin/boozang
LABEL maintainer="Nicolas Degardin <degardin.n@gmail.com>"

USER root

RUN apt-get update && apt-get install -y jq python-pip

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker

# AWS CLI
RUN pip install --upgrade pip
RUN pip install awscli
ENV PATH=.:$PATH

VOLUME /var/lib/docker
EXPOSE 2375

ENTRYPOINT []
CMD ["wrapdocker"]