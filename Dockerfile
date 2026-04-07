###### Build #####
FROM node:12-slim AS node
WORKDIR /
COPY . .
RUN npm install
RUN npm run build -- --prod


###### Build the Delivery #####
FROM nginx:alpine
WORKDIR /var/cache/nginx
COPY --from=node /dist /usr/share/nginx/html
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf


# ########################
# # docker build . -t  vue-demo:3.0
# # docker run --rm -d --publish 8080:80  --name vd3 vue-demo:3.0


