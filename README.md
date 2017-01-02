# Docker image for Node

This image is based on official [Node image](https://github.com/nodejs/docker-node) and contains:

- [Dumb-init](https://github.com/Yelp/dumb-init) for faster signal handling
- [Yarn](https://yarnpkg.com/) package manager
- Unprivileged user account *app* (`/usr/src/app`)
- Onbuild variant

## Usage

### Interactive

    docker run --rm -it hstkk/node
    > console.log('Hello world');
    Hello world

    docker run --rm -it hstkk/node bash
    app@3f6897f307c3:~$ echo Hello world
    Hello world

Example of Yarn usage:

    docker run -v $(pwd):/usr/src/app --rm -it hstk/node yarn init
    yarn init v0.18.1
    question name (app): foo
    question version (1.0.0): bar
    question description: baz
    question entry point (index.js):
    question git repository:
    question author:
    question license (MIT):
    success Saved package.json
    Done in 11.37s.

### Inline command(s)

    docker run hstkk/node node -e "console.log('Hello world');"
    Hello world

Example of Yarn usage:

    docker run -v $(pwd):/usr/src/app --rm -t hstkk/node yarn add greeting

### Create a new image based on this

Onbuild image takes care of installing dependencies and then executes your app by using `yarn start`.

    # Dockerfile
    FROM hstkk/node-onbuild
    # additional stuff

Build and run your own image:

    docker build -t app .
    docker run --rm -it app

### Docker compose

> Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a Compose file to configure your application’s services. Then, using a single command, you create and start all the services from your configuration.
>
> -- [Overview of Docker Compose](https://docs.docker.com/compose/overview/)

    # docker-compose.yml
    version: '2'
    services:
      app:
        image: hstkk/node-onbuild
        volumes:
          - .:/usr/src/app
        environment:
          NODE_ENV: production

Build and run your app:

    docker-compose up
