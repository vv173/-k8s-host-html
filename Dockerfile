FROM nginx:1.21.4-alpine

RUN apk update && \
	apk add unzip

ADD https://github.com/krzysztofkropatwa/testhtml/raw/master/content.zip /tmp

RUN unzip -o /tmp/content.zip -d /usr/share/nginx/html && \
         rm /tmp/content.zip && \
         apk del unzip && \
         rm -rf /var/cache/apk/*

RUN sed -i 's/listen  .*/listen 9090;/g' /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d

RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

EXPOSE 9090

USER nginx

CMD ["nginx", "-g", "daemon off;"]
