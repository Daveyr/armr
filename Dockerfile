FROM arm32v7/ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install r-base -y
