FROM debian:3.9

LABEL description "Simple parametrable let's encrypte docker container"

ENV RSA_KEY_SIZE=4096 DOMAIN=my.domain EMAIL_NOTIFY=email@doman WORKINKG_DIR=/var/lib/letsencrypt
ENV LOG_DIR=/var/log/letsencrypt SERVER=https://acme-v02.api.letsencrypt.org/directory

RUN apt update && apt-get install -y \
    git bash \
    && cd / \
    && git clone https://github.com/letsencrypt/letsencrypt \
    && cd letsencrypt
    
CMD ./letsencrypt-auto certonly --rsa-key-size ${RSA_KEY_SIZE} -d ${DOMAIN} --email ${EMAIL_JOTIFY} \
    --config-dir ${CONFIG_DIR} --work-dir ${WORKING_DIR} --logs-dir ${LOG_DIR} \
    --server ${SERVER} --agree-tos 
