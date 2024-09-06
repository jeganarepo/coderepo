Challenge-02
Before run the dokcer-compose command make sure you have golong script to
build the dokcer image.

Copy the Dockerfile and docker-compose.yaml directory

Run the below command to build the docker image using docker-compose
    docker-compose build --build-arg ENVIRONMENT=prod/dev
Based on the ENVIRONMENT the file-prod/dev.txt copied to file.txt. 
When access the page it display the content based on the env

Run the below command to run docker
    docker-compose up -d

