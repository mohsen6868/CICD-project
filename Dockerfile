FROM arti.safirdev.ir/docker-local/node:20.9.0-alpine as builder
USER root
# Set the working directory to /app
WORKDIR '/app'

# Copy package.json and package-lock.json for Next.js
COPY package*.json .

# Install build dependencies, including Python and make
RUN apk add --no-cache python3 make g++

# Install dependencies
RUN npm cache clean --force

# Install sharp globally with --unsafe-perm (this can help avoid some build issues)
RUN npm install -g --unsafe-perm sharp

# Attempt to install node-sass and handle errors
RUN npm install --legacy-peer-deps --save node-sass
# Copy the rest of the app's source code to the container
COPY . .

# Build the project
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "run", "start"]
