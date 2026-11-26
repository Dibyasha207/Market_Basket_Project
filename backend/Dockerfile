# Use official Node.js LTS image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy application source code
COPY . .

# Expose backend port
EXPOSE 5000

# Set environment variables default
ENV NODE_ENV=production
ENV PORT=5000

# Start server
CMD ["node", "server.js"]
