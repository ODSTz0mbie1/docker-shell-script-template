FROM python:3.11-slim

# Set working directory in the container
WORKDIR /app

# Copy requirements file (if any) and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your Python script(s) to the container
COPY . .

# Command to run your app
CMD ["python", "main.py"]