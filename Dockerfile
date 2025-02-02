# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip git curl sudo

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Install Python virtual environment package
RUN apt-get install -y python3-venv

# Create a virtual environment for Open WebUI
RUN python3 -m venv /opt/open-webui-venv && \
    . /opt/open-webui-venv/bin/activate && \
    pip install open-webui

# Expose the port for Open WebUI
EXPOSE 8080

# Ensure Ollama is running and pull the model at runtime
CMD ["sh", "-c", "ollama serve & sleep 5 && ollama pull deepseek-r1:7b && /opt/open-webui-venv/bin/open-webui serve"]
