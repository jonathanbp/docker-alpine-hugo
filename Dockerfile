FROM alpine:3.2
MAINTAINER Jonathan Bunde-Pedersen <jonathan@purebadger.com>

ENV HUGO_VERSION 0.16
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

# Install pygments (for syntax highlighting) and bash
RUN apk update && apk add py-pygments && apk add bash && rm -rf /var/cache/apk/*

# Download and Install hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tgz /usr/local/
RUN tar xzf /usr/local/${HUGO_BINARY}.tgz -C /usr/local/ \
	&& ln -s /usr/local/${HUGO_BINARY}/${HUGO_BINARY} /usr/local/bin/hugo \
	&& rm /usr/local/${HUGO_BINARY}.tgz

EXPOSE 1313
CMD hugo version
