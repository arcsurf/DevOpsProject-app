#!groovy

def DOCKER_IMAGE = 'app_image'
def DEPLOY_ENV = 'prod'
def commit

pipeline {
    agent any

    stages {
        stage ('Build Docker image') {
            steps {
                script {
                    commit = getCommit()
                    echo 'Building Docker image..'
                    sh "echo 'building Docker image...'"
                    //sh "./build-tag-push.sh ${DOCKER_IMAGE}"
                }
            }
        }

        stage ('Image validation') {
            agent {
                docker {
                    // label 'general'
                    //image "image_name_and_path/${DOCKER_IMAGE}:${commit}"
                    //args  '--group-add 999 -v /home/jenkins:/home/jenkins -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }

            steps {
                script {
                    echo 'Start image validation'
                    // sh './validation.sh'
                }
            }
        }

        stage ('Publish image') {
        }

        stage ('Deploy image to ${DEPLOY_ENV}') {
            steps {
                script {
                    echo 'replacing running container in ${DEPLOY_ENV}'
                    //sh 'docker -H=app.couso.com.ar rm -f nombre_container || true'
                    //sh 'docker -H=app.couso.com.ar run --restart-always -p 80:80 --name ${IMAGE_NAME}_${DEPLOY_ENV}'
                    echo 'Deployed!'
                }
            }
        }
    }
}
