FROM node:18-alpine as build_phase

WORKDIR '/app'

COPY ./package.json .
RUN npm install 

COPY . . 

RUN npm run build 


FrOM nginx
COPY --from=build_phase /app/build/ /usr/share/nginx/html