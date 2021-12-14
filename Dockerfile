FROM nginx:1.21.4-alpine

RUN apk update && \
apk add unzip

ADD https://github.com/krzysztofkropatwa/testhtml/raw/master/content.zip /tmp

RUN unzip -o /tmp/content.zip -d /usr/share/nginx/html \
&& rm /tmp/content.zip