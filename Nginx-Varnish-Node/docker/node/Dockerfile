################################################################################
# Node Server
################################################################################
FROM node:14-alpine as node

WORKDIR /app

COPY --chown=node:node src/ /app

RUN npm install

EXPOSE 80

USER node

CMD ["node", "index.js"]
