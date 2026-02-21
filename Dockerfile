# Use lightweight Python image
FROM python:3.11-slim

# Install dependencies (added zstd)
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    tar \
    wget \
    git \
    zstd \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy code and requirements
COPY moondream_api.py requirements.txt /app/

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Pull the Moondream model
RUN ollama pull moondream:latest

# Expose API port inside container
EXPOSE 8019

# Run FastAPI server
CMD ["uvicorn", "moondream_api:app", "--host", "0.0.0.0", "--port", "8019"]