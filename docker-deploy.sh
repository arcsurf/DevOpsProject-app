#!/bin/sh
# test3
docker -H ssh://ubuntu@app.couso.com.ar rm -f app_prod
docker -H ssh://ubuntu@app.couso.com.ar run -d -p 5000:5000 --name app_prod arcsurfing/devopsapp:v0.0.4
