#node
FROM node:latest as nodework
WORKDIR /react-docker
COPY package.json .
RUN npm install
COPY . .
COPY .  /app


#nginx block
FROM nginx
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=nodework /react-docker/build .
ENTRYPOINT [ "nginx","-g","daemon off:" ]