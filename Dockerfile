FROM node:14

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn

COPY . .
COPY config.env.production config.env

RUN yarn build

ENV NODE_ENV=production

EXPOSE 5000

CMD [ "node", "dist/index.js" ]

USER node