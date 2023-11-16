#ligt weight version of linux
FROM node:lts-alpine3.18

#Node environment
ENV NODE_ENV production

#make appropriate directories
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

#Copy the packages
COPY package*.json ./

#Define work directory
WORKDIR /home/node/app

#Check that files are owned by non-root user
USER node

RUN npm install

#Copy application code
COPY --chown=node:node . .

EXPOSE 80

#Start the application
CMD [ "node", "index.js" ]
