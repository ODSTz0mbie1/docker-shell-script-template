FROM python:3-slim

# Set working directory in the container
WORKDIR /app

# Copy requirements file (if any) and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your Python script(s) to the container
COPY *.py .

# Command to run your app
ENTRYPOINT ["python", "main.py"]