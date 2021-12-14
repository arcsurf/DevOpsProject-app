#!groovy

def DOCKER_HUB_USER = 'arcsurfing'
def DOCKER_HUB_TOKEN = '43e86ce5-89d1-4082-a0f2-5599644a7256'
def DOCKER_IMAGE = 'arcsurfing/devopsapp'
def DEPLOY_ENV = 'prod'
def VERSION = 'v0.0.1'
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
                    //sh "chmod +x docker-build.sh"
                    sh "./docker-build.sh"
                    //sh "docker build -t ${DOCKER_IMAGE}:${VERSION} ."
                }
            }
        }

        stage ('Image validation') {
            //agent {
                //docker {
                    // label 'general'
                    //image "image_name_and_path/${DOCKER_IMAGE}:${commit}"
                    //args  '--group-add 999 -v /home/jenkins:/home/jenkins -v /var/run/docker.sock:/var/run/docker.sock'
                //}
            //}

            steps {
                script {
                    echo 'Start image validation'
                    // sh './validation.sh'
                }
            }
        }

        stage ('Publish image') {
            steps {
                script {
                    echo "Publishing ${DOCKER_IMAGE}:${VERSION} to Docker Hub"
                    // sh "docker push ${DOCKER_IMAGE}:${VERSION}"
                    // sh './validation.sh'
                }
            }
        }

        stage ('Deploy image to ${DEPLOY_ENV}') {
            steps {
                script {
                    echo "replacing running container ${DOCKER_IMAGE}_${DEPLOY_ENV}"
                    //sh "docker -H=app.couso.com.ar rm -f ${DOCKER_IMAGE}_${DEPLOY_ENV} || true'
                    //sh "docker -H=app.couso.com.ar run --restart-always -p 80:80 --name ${DOCKER_IMAGE}_${DEPLOY_ENV}'
                    echo "Deployed!"
                }
            }
        }
    }
}
