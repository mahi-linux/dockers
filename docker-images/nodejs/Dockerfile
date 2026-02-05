FROM node:25.6.0-bookworm
WORKDIR /usr/src/app
COPY package*.json app.js ./
RUN npm install && npm audit fix
EXPOSE 3000
CMD [ "node", "app.js" ]