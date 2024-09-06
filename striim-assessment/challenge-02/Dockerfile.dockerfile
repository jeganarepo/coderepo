# Golang base image version
FROM golang:1.22-alpine

# Set the working 
WORKDIR /app


# Copy server.go file into the container
COPY server.go .

# ARG to copy the file based on environment
ARG ENVIRONMENT

# 
RUN go mod init buildapp
RUN go mod download

# Copy file{prod/dev}.txt into the container
COPY  ./file-${ENVIRONMENT}.txt ./file.txt

# Build the Go application
RUN go build -o golang-web

# Expose port 8080
EXPOSE 8080

# Command to run the executable
CMD ["./golang-web"]