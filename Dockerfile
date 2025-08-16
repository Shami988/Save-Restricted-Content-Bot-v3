# Use the desired base image
FROM ubuntu:latest

# Set environment variables to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        python3-pip \
        wget \
        ffmpeg \
        bash \
        neofetch \
        software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set any additional commands as needed below
# ...
