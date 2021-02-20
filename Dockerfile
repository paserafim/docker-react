FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# Folder that stores --> /app/build

# Step 2 (Multistep process - get result from step 1)
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html


