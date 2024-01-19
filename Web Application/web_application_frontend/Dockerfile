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
FROM nginx:alpine
