# DevOpsProject-app

### This app provides the covariance matrix of a list of values pairs provided via HTTP requests.

#### You can test the production or stagin app from the public side doing a curl POST METHOD to:
###### Production: http://app.couso.com.ar:5000/calculate
###### develop: http://app.couso.com.ar:5001/calculate

###### Example:
```
$ curl -X POST -H "Content-Type: text/plain" -d '(1.115,2.119), (1.108,2.220), (1.101,2.209), (1.110,2.209), (1.112,2.212)' http://localhost:5000/calculate
[[0.5040080000000002, 0.5582240000000002, 0.5562160000000002, 0.5516980000000001, 0.5522000000000001], [0.5582240000000002, 0.6182720000000002, 0.6160480000000002, 0.611044, 0.6116000000000001], [0.5562160000000002, 0.6160480000000002, 0.6138320000000002, 0.608846, 0.6094], [0.5516980000000001, 0.611044, 0.608846, 0.6039005, 0.60445], [0.5522000000000001, 0.6116000000000001, 0.6094, 0.60445, 0.6050000000000001]]
```
