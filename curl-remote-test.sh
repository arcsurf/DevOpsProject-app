#!/bin/sh

sleep 1
curl -X POST -H "Content-Type: text/plain" -d '(1.115,2.119), (1.108,2.220), (1.101,2.209), (1.110,2.209), (1.112,2.212)' http://app.couso.com.ar:5000/calculate
