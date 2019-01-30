#!/bin/bash

docker run -d --name selenium-hub -p 4444:4444 selenium/hub:3.141.59-fluorine && CH=$(docker run --rm --name=anna-chrome --link selenium-hub:hub --shm-size=2g anna-chrome)
