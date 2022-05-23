FROM docker.io/library/node:16.15.0-alpine as build
WORKDIR /usr/src/app
ENV DOCKERIZE_VERSION v0.6.1
COPY . /usr/src/app
RUN apk add --no-cache openssl \
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && npm install -g npm@8.10.0 \
    && npm install \
    && npm ci --omit=dev

FROM gcr.io/distroless/nodejs-debian11:16-debug
WORKDIR /app
COPY --from=build /usr/src/app /app
COPY --from=build /usr/local/bin/dockerize /usr/local/bin/dockerize
ENTRYPOINT ["dockerize", "--wait", "tcp://mysql:3306", "--timeout", "20s"]
CMD ["/nodejs/bin/node", "index.js"]