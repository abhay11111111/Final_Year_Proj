# Use the official Python image as the base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the working directory
COPY . /app

# Install the application dependencies
RUN pip install -r requirements.txt
# 👇️ upgrade pip
RUN pip install --upgrade pip
ENV PIP_ROOT_USER_ACTION=ignore
# Define the entry point for the container
CMD ["flask", "run", "--host=0.0.0.0"]
