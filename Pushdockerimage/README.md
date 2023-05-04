## What this does?
This repo demonstrates how to create Jenkinsfile to build and push a docker image, tagged with custom build number or latest

1. Install Docker on the Jenkins node [+] https://docs.docker.com/engine/install/ubuntu/

2. To avoid the permission issue run `sudo chmod 666 /var/run/docker.sock` on the node after Docker is installed.

### Jenkins plugins

Install the following plugins for the demo.
- Docker plugin  
- Docker Pipeline
- GitHub Integration Plugin
