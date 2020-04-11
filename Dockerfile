FROM node:alpine as builder 
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . . 
RUN npm run build
# above will create a build phase and copy everything into the build folder

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# copy command will copy from above stage from build folder in app directory to the nginx directory that we got from dockerhub.