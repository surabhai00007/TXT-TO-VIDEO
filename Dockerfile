# Python 3.10.8 with Debian Bullseye (safe and stable)
FROM python:3.10.8-slim-bullseye

# Install system dependencies
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    gcc libffi-dev musl-dev ffmpeg aria2 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy project files to /app
COPY . /app/
WORKDIR /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt
RUN pip install --no-cache-dir pytube

# Set environment variable (edit this if needed)
ENV COOKIES_FILE_PATH="youtube_cookies.txt"

# Start the application (only one main process recommended)
CMD ["python3", "main.py"]