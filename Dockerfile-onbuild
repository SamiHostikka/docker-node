FROM hstkk/node:9
MAINTAINER hstkk

# Env
ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV

# Install dependencies
ONBUILD COPY package.json yarn.lock .
ONBUILD RUN yarn install

# Copy source code
ONBUILD COPY . .

# Fix permissions
ONBUILD USER root
ONBUILD RUN chown -R app .
ONBUILD USER app

# Exec
CMD ["yarn", "start"]
