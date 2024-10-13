# Use an official Python image as the base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /src

# Copy the requirements file into the container
COPY ./requirements.txt /src/prereq/requirements.txt

# Install the dependencies from the container directory
RUN pip install --no-cache-dir --upgrade -r /src/prereq/requirements.txt

# Copy FastAPI app code to the container
COPY ./src/ /src/

# Expose port 8000 for the FastAPI application
EXPOSE 8000

# Run the FastAPI application using Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
