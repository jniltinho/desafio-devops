FROM node:16-bullseye-slim as builder

## https://wkrzywiec.medium.com/build-and-run-angular-application-in-a-docker-container-b65dbbc50be8
## https://www.indellient.com/blog/how-to-dockerize-an-angular-application-with-nginx/

# docker build --no-cache -t frontend .
# docker run -p 8080:80 frontend
# docker run -it --rm -v $(pwd):/app node:16-bullseye-slim bash

WORKDIR /opt/app
COPY . .
RUN npm install
RUN npm link @angular/cli@12.2.16
RUN npm run build

FROM nginx:1.23.2-alpine
COPY nginx.conf /etc/nginx/nginx.conf
## COPY --from=builder /opt/app/dist/letscodebyada-app/* /web/
COPY --from=builder /opt/app/dist/letscodebyada-app /usr/share/nginx/html
