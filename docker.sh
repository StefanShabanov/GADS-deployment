#!/bin/bash
docker run -d --restart=always --name mongodb -p 27017:27017 mongo:6.0