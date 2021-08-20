FROM alpine:latest

RUN apk add --no-cache python3 py3-pip openssl curl bash git

RUN pip3 install requests

ENV CRONTAB_FILE=/etc/periodic/weekly/ns_letsencrypt

RUN echo "#!/bin/sh" > ${CRONTAB_FILE} && \
     echo "/root/ns-letsencrypt/ns-cronjob.sh > /proc/1/fd/1 2>/proc/1/fd/2" >> ${CRONTAB_FILE} && \
     chmod 0744 ${CRONTAB_FILE}

COPY ./docker/entrypoint.sh /

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["crond", "-f", "-d", "8" ]