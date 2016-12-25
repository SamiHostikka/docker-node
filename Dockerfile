FROM node:7.3.0-slim
MAINTAINER hstkk

# Add unprivileged user
RUN useradd -d /usr/src/app -m -r app
WORKDIR /usr/src/app
