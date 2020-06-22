
### STAGE 1: Build ###
FROM node:alpine AS build
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: Run ###
FROM nginx:alpine
EXPOSE 80
COPY --from=build /usr/src/app/dist/DockerDemo /usr/share/nginx/html