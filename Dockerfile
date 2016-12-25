FROM node:7.3.0-slim
MAINTAINER hstkk

# Add unprivileged user
RUN useradd -d /usr/src/app -m -r app
WORKDIR /usr/src/app

# Install Dumb-init for faster signal handling
ENV DUMB_INIT_VERSION 1.2.0
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v$DUMB_INIT_VERSION/dumb-init_$DUMB_INIT_VERSION_amd64 \
  && chmod +x /usr/local/bin/dumb-init

# Install Yarn package manager
RUN npm install --global yarn \
  && npm cache clean

# Exec
USER app
ENTRYPOINT ["dumb-init"]
CMD ["node"]
