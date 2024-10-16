# Use the official slim Python image for smaller footprint
FROM python:3.12-slim

# Set the working directory
WORKDIR /nosql/

# Copy only requirements first to leverage Docker cache
COPY requirements.txt .

# Install dependencies in one command to reduce layers
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Define the default command to run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]