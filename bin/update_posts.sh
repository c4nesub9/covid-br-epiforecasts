#!/bin/bash

Rscript utils/update_posts.R
cp -r _posts/national/ne-cities/ne-cities.html posts/ne-cities/index.html
cp -r _posts/national/brazil/brazil.html posts/states/index.html
cp -r _posts/national/cities-ba/cities-ba.html posts/cities-ba/index.html
cp -r _posts/national/deaths-ne-cities/deaths-ne-cities.html posts/deaths-ne-cities/index.html
cp -r _posts/national/deaths-brazil/deaths-brazil.html posts/deaths-states/index.html
