FROM willhallonline/ansible:2.15.2-alpine-3.16

WORKDIR root/

COPY id_rsa /root/.ssh/id_rsa

ADD . .

