#!/bin/bash

sudo docker kill angular-site

sudo docker rm angular-site

sudo docker pull cacanuck/angular-site:latest

sudo docker run -d --name angular-site -p 80:4200 cacnauck/angular-site:latest
