FROM node:18-slim

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN yarn install

# Copy app source
COPY . .

# CI in Image Build Process
RUN yarn lint
RUN yarn test

# Build
RUN yarn build

EXPOSE 3000

CMD [ "yarn", "start" ]