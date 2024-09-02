# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Copy the application code inside the container
COPY /src /opt/src

# CD to the application code directory
WORKDIR /opt/src

# Intall python requirements
RUN pip install -r requirements.txt

# Run the application leveraging on Docker Entrypoint
ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:8888", "wsgi:app"]