ARG BASE_IMAGE="ubuntu:18.04"
FROM $BASE_IMAGE

# Copy setup script to image
COPY ./docker ./docker
RUN bash -c "chmod +x /docker/entrypoint-setuser.sh"

# Run the script to install dependency
RUN bash -c "apt-get update && \
    apt-get install -y apt-utils wget gnupg"
RUN bash -c "cd && bash /docker/setup_environment.sh"
WORKDIR "/root/workspace"