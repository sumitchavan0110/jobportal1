# Use the official Python image as the base image
FROM python:3.9

# Set environment variables to ensure Python operates in a more predictable manner
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /jobportal

# Copy the requirements file into the container at /Newjobportal
COPY requirements.txt /jobportal/

# Upgrade pip and install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the Django project code into the container's working directory
COPY . /jobportal/

# Expose the port on which Django will run
EXPOSE 8000

# Command to run Django's development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
