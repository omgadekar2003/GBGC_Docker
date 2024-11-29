# # Use the official Python 3.9 slim image as the base
# FROM python:3.9-slim

# # Set the working directory inside the container
# WORKDIR /app

# # Copy project files into the working directory
# COPY . /app

# # Install Python dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Command to run the application
# CMD ["python", "main.py"]
####
###
##
#


# Use the official Python 3.9 slim image as the base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy project files into the working directory
COPY . /app

# Install system dependencies required for some Python packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential libglib2.0-0 libglib2.0-dev libx11-dev libxcb-xinerama0 libxkbcommon-x11-0 libx11-xcb-dev && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["python", "main.py"]
