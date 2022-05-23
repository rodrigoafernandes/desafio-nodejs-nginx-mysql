FROM docker.io/library/node:14.4.0-alpine as build
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN npm ci --omit=dev

FROM gcr.io/distroless/nodejs-debian11:14
WORKDIR /app
COPY --from=build /usr/src/app /app
CMD ["index.js"]
