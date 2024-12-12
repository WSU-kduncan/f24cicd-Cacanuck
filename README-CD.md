## Part 1

1. The CD portion of the project is to continuously deploy the container images that I create to Dockerhub. Using Github actions and workflows, the image should be pushed automatically whenever an update is made and pushed to the Github repo.

2. To generate a tag in Git, do `git tag <tag_name>`.  This will create the tag for the commit that is currently checkout out.  You can only make a tag after creating a commit.  To push the tag, do `git push origin <tag_name>`.

3. The Github workflow that I have created works when a commit is pushed or a tag is pushed to the Git repo. It sends the tagged version of the angular site to Dockerhub.

[Link to DOckerhub Repo for this project](https://hub.docker.com/repository/docker/cacanuck/angular-site/general)
