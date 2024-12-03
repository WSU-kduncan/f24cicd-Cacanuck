# Part One

This project is to demonstrate the usage of containers. Using a Node.js runner, implement a simple website using Angular, while being containerized.

To install Docker on an Ubuntu EC2 instance, first the following commands need to be run:
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

Then run the following command to install Docker:

`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`

The `Dockerfile` enabels the easy creation of a container.  The `FROM` section states what runner the container will be based off of, in this case node:18-bullseye. The `WORKDIR` tag initializes where inside the container's file system that the application is goign to located.  the `COPY` section dictates what fodlers get copied, and to where they go inside the container file system.  The `RUN` command tells the container to do any other actions that are needed to be run in the command line. In this instance, the Angular CLI is needed to be installed using the node package manager.  The second `WORKDIR` section makes the container go further into the file system, to be located in the correct spot so that the command to start the application can work properly.  The `CMD` command is what starts the application, and has any of the parameters that the command to start the app need.

To use the Dockerfile, first navigate to the directory that contains the DOckerfile, then type in `docker build -t "name" .`. This will create an image using the Dockerfile loacted in the current directory.  Then to run the container, type in `docker run -d -p 80:80 "name"`. The `-d` flag detaches from the container, making the container a background process. The `-p` flag denotes what ports to use, the first number is the port from the host machine, the second number being the port on the corresponding container image. To view the application, you can either `curl localhost` or open a web browser and type in the public ip of the system that is running the container.

To create a public repo in Dockerhub, log into a Dockerhub account and create a new repo, and mark the repo as public so that images can be pulled and pushed to and from the repo. To link to your Dockerhub account, go to the security section in the Dockerhub settings. Create a new access token, copy it, and type it in when logging in to Dockerhub from the terminal, using the command `docker login -u "username"`. To push the container image to Dockerhub, ensure that you are signed in. Then, build an image if you have not done so already. Then, type `docker push "username"/"repository"`.

[Link to Dockerhub Repo for this project] (https://hub.docker.com/repository/docker/cacanuck/angular-site/general)


To set up secrets for Github Actions, go to the settings section of the Github REPOSITORY, and click on secrets -> actions. Then name the secret, and enter in the box what information the secret will contain, be it a username, password, or token.  For this project, there is a DOCKER_USERNAME secret and a DOCKER_TOKEN secret.

The workflow creates the container image for tha angular site, and then pushes it to DOckerhub.  If someone was to use the workflow file to duplicate the project, they would need to change the Github secrets to have their own login credentials, as well as change the name of the repository that it would be pushed to.
