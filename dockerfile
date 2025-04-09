# Start with official Python 3.12.2 base
FROM python:3.12.10-slim

# Set working directory
WORKDIR /app

# System packages required for some Python libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libglib2.0-0 \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python packages
COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy rest of the project files
COPY . .

# Default shell
CMD ["bash"]
