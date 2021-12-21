#!groovy

def DOCKER_HUB_USER = 'arcsurfing'
def DOCKER_APP_SERVER_USER = 'ubuntu'
def DOCKER_APP_SERVER_HOST = 'app.couso.com.ar'
def DOCKER_IMAGE = 'arcsurfing/devopsapp'
def DEPLOY_ENV = 'prod'
def VERSION = 'v0.0.7'

pipeline {
    agent any

    environment {
        DOCKER_HUB_TOKEN = credentials('d66d6142-a8bf-420f-a0e0-6043ff297014')
    }

    stages {
        stage ('Build Docker image') {
            steps {
                script {
                    echo "Building Docker image ${DOCKER_IMAGE} for version ${VERSION}"
                    sh "echo 'building Docker image...'"
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

        stage ('Test container locally') {
            steps {
                script {
                    echo 'running a curl'
                    sh "chmod +x curl-test.sh"
                    sh "./curl-test.sh || true"
                }
            }
        }

        stage ('Publish image to Docker Hub') {
            steps {
                script {
                    echo "Publishing ${DOCKER_IMAGE}:${VERSION} to Docker Hub"
                    sh "docker login -u='${DOCKER_HUB_USER}' -p='${DOCKER_HUB_TOKEN_PSW}'"
                    sh "docker image push ${DOCKER_IMAGE}:${VERSION}"
                }
            }
        }

        stage ('Deploy image to App Server') {
            steps {
                script {
                    echo "replacing running container app_${DEPLOY_ENV}"
                    sh "docker -H ssh://${DOCKER_APP_SERVER_USER}@${DOCKER_APP_SERVER_HOST} rm -f app_${DEPLOY_ENV} || true"
                    sh "docker -H ssh://${DOCKER_APP_SERVER_USER}@${DOCKER_APP_SERVER_HOST} run -d -p 5000:5000 --name app_${DEPLOY_ENV} ${DOCKER_IMAGE}:${VERSION}"
                    echo "Deployed!"
                }
            }
        }
        stage ('Test container remotely') {
            steps {
                script {
                    echo 'running a curl'
                    sh "chmod +x curl-remote-test.sh"
                    sh "./curl-remote-test.sh"
                }
            }
        }
    }
}
