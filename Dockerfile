# Stage 1: Compile and build angular codebase

# Use official node image as the base image
FROM node as node
ENV NODE_OPTIONS="--openssl-legacy-provider"
# Working directory
WORKDIR /app
# copy source destination
COPY . .
# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build --prod

FROM nginx:alpine
COPY --from=node /app/dist/docker-app /usr/share/nginx/html

#EXPOSE PORT 80
EXPOSE 80