FROM rustlang/rust:nightly-alpine3.15 as builder
WORKDIR /usr/src/freyground/
COPY . .
RUN apk add --no-cache \
        nodejs=16.17.1-r0 \
        npm \
        make \
        build-base

RUN make rbuild

FROM alpine:3.15 as runner
WORKDIR /var/www/
EXPOSE 80:8000

COPY --from=builder /usr/src/freyground/dist/ /var/www/
