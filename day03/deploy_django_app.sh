#!/bin/bash

<< task
Deploy a Django app on macOS
task

code_clone(){
        if [ -d "django-notes-app" ]; then
                echo "The code directory already exists."
        else
                echo "Cloning the django app...."
                git clone https://github.com/LondheShubham153/django-notes-app.git
        fi
}

install_requirements(){
        echo "Installing dependencies via Homebrew..."
        # Checking if Homebrew is installed
        if ! command -v brew &> /dev/null; then
                echo "Homebrew not found. Please install it first from https://brew.sh"
                exit 1
        fi
        
        # Nginx installation for Mac
        if ! command -v nginx &> /dev/null; then
                brew install nginx
        fi
}

required_restarts(){
        echo "Starting Nginx service..."
        # macOS alternative to systemctl
        brew services start nginx
}

deploy(){
        echo "Building and running Docker container..."
        # Move into the directory where the Dockerfile actually is
        cd django-notes-app || exit 1
        
        docker build -t notes-app .
        docker run -d -p 8000:8000 notes-app:latest
}

echo "************Deployment Started!*********"
code_clone
install_requirements
required_restarts
deploy
echo "************Deployment Done!*********"
#!/bin/bash

<< task
Deploy a Django app on macOS
task

code_clone(){
        if [ -d "django-notes-app" ]; then
                echo "The code directory already exists."
        else
                echo "Cloning the django app...."
                git clone https://github.com/LondheShubham153/django-notes-app.git
        fi
}

install_requirements(){
        echo "Installing dependencies via Homebrew..."
        # Checking if Homebrew is installed
        if ! command -v brew &> /dev/null; then
                echo "Homebrew not found. Please install it first from https://brew.sh"
                exit 1
        fi
        
        # Nginx installation for Mac
        if ! command -v nginx &> /dev/null; then
                brew install nginx
        fi
}

required_restarts(){
        echo "Starting Nginx service..."
        # macOS alternative to systemctl
        brew services start nginx
}

deploy(){
        echo "Building and running Docker container..."
        # Move into the directory where the Dockerfile actually is
        cd django-notes-app || exit 1
        
        docker build -t notes-app .
        docker run -d -p 8000:8000 notes-app:latest
}

echo "************Deployment Started!*********"
code_clone
install_requirements
required_restarts
deploy
echo "************Deployment Done!*********"
#!/bin/bash

<< task
Deploy a Django app
and handle the code for errors
task

code_clone(){
	echo "Cloning the django app...."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements(){
	echo "Installing dependencies"
	sudo apt-get install docker.io ngins -y
}

required_restarts(){
	sudo systemctl anable docker
	sudo systemctl enable nginx
}

deploy(){
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
}


echo "************Deployment Started!*********"

if ! code_clone; then
	echo "The code directory alredy exists"
	cd django-notes-app
fi
install_requirements
required_restarts
deploy
echo "************Deployment Done!*********"


