#!groovy

def DOCKER_HUB_USER = 'arcsurfing'
def DOCKER_HUB_TOKEN = '43e86ce5-89d1-4082-a0f2-5599644a7256'
def DOCKER_IMAGE = 'arcsurfing/devopsapp'
def DEPLOY_ENV = 'prod'
def VERSION = 'v0.0.2'
def commit

pipeline {
    agent any

    stages {
        stage ('Build Docker image') {
            steps {
                script {
                    // commit = getCommit()
                    echo "Building Docker image ${DOCKER_IMAGE} for version ${VERSION}"
                    sh "echo 'building Docker image...'"
                    // docker.build
                    //sh "./docker-build.sh"
                    sh "docker build -t ${DOCKER_IMAGE}:${VERSION} ."
                }
            }
        }

        stage ('Run image') {
            steps {
                script {
                    echo 'running container locally'
                    sh "docker rm -f app_${DEPLOY_ENV} || true"
                    sh "docker run -d -p 5000:5000 --name app_${DEPLOY_ENV} ${DOCKER_IMAGE}:${VERSION}"
                }
            }

        }

        stage ('Test image locally') {
            steps {
                script {
                    echo 'running a curl'
                    sh "chmod +x curl-test.sh"
                    sh "./curl-test.sh"
                    //sh "curl -X POST -H 'Content-Type: text/plain' -d '(1.115,2.119), (1.108,2.220), (1.101,2.209), (1.110,2.209), (1.112,2.212)' http://localhost:5000/calculate"
                }
            }
        }

        stage ('Publish image to Docker Hub') {
            steps {
                script {
                    echo "Publishing ${DOCKER_IMAGE}:${VERSION} to Docker Hub"
                    sh "docker login -u='${DOCKER_HUB_USER}' -p='${DOCKER_HUB_TOKEN}'"
                    sh "docker image push ${DOCKER_IMAGE}:${VERSION}"
                }
            }
        }

        stage ('Deploy image to App Server') {
            steps {
                script {
                    echo "replacing running container app_${DEPLOY_ENV}"
                    //sh "docker -H=app.couso.com.ar rm -f app_${DEPLOY_ENV} || true'
                    //sh "docker -H=app.couso.com.ar run --restart-always -p 5000:5000 --name app_${DEPLOY_ENV} ${DOCKER_IMAGE}:${VERSION}'
                    echo "Deployed!"
                }
            }
        }
    }
}
