FROM i386/node:10-alpine AS build

COPY . /app

WORKDIR /app

RUN npm i --only=prod

FROM i386/node:10-alpine

COPY --from=build /app /app

USER node

CMD ["node", "/app/index.js"]
