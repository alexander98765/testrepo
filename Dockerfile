## Use the official Python 3.8 slim image as the base image
#FROM python:3.8-slim

## Set the working directory within the container
##WORKDIR /testrepo
#WORKDIR /usr/src/app

## Copy the necessary files and directories into the container
##COPY beings/ /testrepo/beings/
##COPY templates/ /testrepo/templates/
##COPY utils/ /testrepo/utils/
##COPY App.py requirements.txt  /testrepo/
#COPY requirements.txt /usr/src/app

## Upgrade pip and install Python dependencies
#RUN pip3 install --upgrade pip && pip install --no-cache-dir -r /usr/src/app/requirements.txt

#COPY . .

## Expose port 5000 for the Flask application
#EXPOSE 3000

##ENTRYPOINT [ "python" ]

## Define the command to run the Flask application using Gunicorn
#CMD [ "python", "/usr/src/app/App.py" ]

FROM python:3.11-alpine

# Create and set the working directory
WORKDIR /app

# Copy only the requirements file first to leverage Docker caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application code
COPY . .

# Expose the port your application will run on
EXPOSE 3000

# Specify the command to run on container start
CMD ["python", "/app/App.py"]