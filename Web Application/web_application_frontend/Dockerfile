# Step 1: Build the app
FROM node:alpine3.18 as build

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Step 2: Serve the app
FROM nginx:1.23-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf *

COPY --from=build /app/build . 
EXPOSE 80
ENTRYPOINT [ "nginx","-g","daemon off;" ]
