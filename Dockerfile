# Use the official Python 3.8 slim image as the base image
FROM python:3.8-slim

# Set the working directory within the container
WORKDIR /testrepo

# Copy the necessary files and directories into the container
COPY beings/ /testrepo/beings/
COPY templates/ /testrepo/templates/
COPY utils/ /testrepo/utils/
COPY App.py requirements.txt  /testrepo/

# Upgrade pip and install Python dependencies
RUN pip3 install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for the Flask application
EXPOSE 3000

ENTRYPOINT [ "python" ]

# Define the command to run the Flask application using Gunicorn
CMD [ "python", "App.py" ]