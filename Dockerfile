FROM nginx:1.15-alpine

RUN apk add nodejs

ENV PORT 8080
ENV BASE_URL ""

COPY ./docker/nginx.conf /etc/nginx/

COPY . /usr/share/nginx/html/

COPY ./docker/run.sh /usr/share/nginx/

RUN chmod +x /usr/share/nginx/run.sh

CMD ["sh", "/usr/share/nginx/run.sh"]
