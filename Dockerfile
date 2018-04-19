FROM r-base
ADD scripts /usr/local/src/scripts
WORKDIR /usr/local/src/scripts

# install dependencies
RUN apt-get update \
 && apt-get install -y libssl-dev libsasl2-dev libcurl4-openssl-dev libxml2-dev \
 && Rscript install.R
