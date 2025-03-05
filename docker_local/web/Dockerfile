FROM node:18-alpine
WORKDIR /web/
COPY web/. .
RUN yarn install
RUN yarn build

FROM nginx:alpine
COPY ./docker_local/nginx/my.conf /etc/nginx/conf.d/my.conf
COPY --from=0 /web/dist /usr/share/nginx/html
