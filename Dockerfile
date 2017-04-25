FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y docker.io

CMD ["dockerd", "--storage-driver=vfs"]