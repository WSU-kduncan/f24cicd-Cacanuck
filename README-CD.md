## Part 1

1. The CD portion of the project is to continuously deploy the container images that I create to Dockerhub. Using Github actions and workflows, the image should be pushed automatically whenever an update is made and pushed to the Github repo.

2. To generate a tag in Git, do `git tag <tag_name>`.  This will create the tag for the commit that is currently checkout out.  You can only make a tag after creating a commit.  To push the tag, do `git push origin <tag_name>`.

3. The Github workflow that I have created works when a commit is pushed or a tag is pushed to the Git repo. It sends the tagged version of the angular site to Dockerhub.

[Link to DOckerhub Repo for this project](https://hub.docker.com/repository/docker/cacanuck/angular-site/general)


## Part 2

1. The public IP for the new instance is `3.93.97.96`, running on Ubuntu.

2. To install docker on the instance, first you must do:
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
to add the Docker GPG key.  Then do:
```echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
to add the repository for Apt resources. Finally, do ` sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin` to download docker.

3. The bash script `refresh.sh` is meant to kill the currently running container named angular-site, pull the latest angular-site from Dockerhub, and then start a new container using the most recently pulled image.  The script is in the user's home directory fo the instance's filesystem.  [Link to refresh.sh](https://github.com/WSU-kduncan/f24cicd-Cacanuck/blob/main/deployment/refresh.sh)

4. To set up adnanh;s webhook, first do `sudo apt install golang-go`.  Then do `sudo apt install webhook`. The webhook is a special url that will trigger the bash script when the webhook url is entered.  The webhook definition file states hte name of the webhook, the exact path of the script that will be run whe nthe webhook is triggered, and the locaiton of where the script is located in the file system. [Link to hook definition file](https://github.com/WSU-kduncan/f24cicd-Cacanuck/blob/main/deployment/hooks.json)

5. In the Dockerhub repository, click on the webhooks tab.  This will allow you to create a webhook and manage existing webhooks.  Enter the name of the webhook, as well as the full url of the webhook.

6. To have the webhook service start as soon as the instance is turned on, you must edit the webhook service file. The defualt location of the service file is `/usr/lib/systemd/system/webhook.service`. Once there, you must change the `ConditionPathExists` and `ExecStart` lines the point to the location of the hooks.json file location. [Link to webhook.service file](https://github.com/WSU-kduncan/f24cicd-Cacanuck/blob/main/deployment/webhook.service)
