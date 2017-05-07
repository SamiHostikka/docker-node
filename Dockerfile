FROM node:7-slim
MAINTAINER hstkk

# Add unprivileged user
ENV WORKDIR /usr/src/app
RUN useradd -d $WORKDIR -m -r app \
  && chown app $WORKDIR
WORKDIR $WORKDIR

# Install Dumb-init for faster signal handling
ENV DUMB_INIT_VERSION 1.2.0
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v$DUMB_INIT_VERSION/dumb-init_${DUMB_INIT_VERSION}_amd64 \
  && chmod +x /usr/local/bin/dumb-init

# Exec
USER app
ENTRYPOINT ["dumb-init"]
CMD ["node"]
