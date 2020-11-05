#!/bin/#!/usr/bin/env bash
apt-get update && apt-get install apache2 -y
sudo bash "echo 'helloworld' > /var/www/html/index.html"
