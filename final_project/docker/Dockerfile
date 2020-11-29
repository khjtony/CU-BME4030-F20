ARG BASE_IMAGE="ubuntu:18.04"
FROM $BASE_IMAGE

# Copy setup script to image
COPY ./docker ./docker

# Run the script
RUN bash -c "apt-get update && \
    apt-get install -y apt-utils wget git gnupg"

RUN bash -c "cd && bash /docker/setup_environment.sh"

WORKDIR "/home/root/workspace"

ENTRYPOINT ["/docker/entrypoint-setuser.sh"]