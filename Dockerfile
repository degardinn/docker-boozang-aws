FROM ndegardin/boozang
LABEL maintainer="Nicolas Degardin <degardin.n@gmail.com>"

RUN apt-get update && apt-get install -y jq python-pip