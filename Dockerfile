FROM python:3.10-slim

# Updating and installing necessary packages in one go
RUN apt-get update && apt-get install -y \
    git \
    curl \
    python3-pip \
    wget \
    ffmpeg \
    bash \
    neofetch \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

# Set the working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install wheel
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Copy application code
COPY . .

# Expose port
EXPOSE 5000

# Command to run the application
CMD ["flask", "run", "-h", "0.0.0.0", "-p", "5000"]
