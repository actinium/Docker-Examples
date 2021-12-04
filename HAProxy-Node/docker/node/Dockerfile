################################################################################
# Node Server
################################################################################
FROM node:14-alpine as node

WORKDIR /app

COPY src/ /app

RUN npm install

EXPOSE 80

CMD ["node", "index.js"]
