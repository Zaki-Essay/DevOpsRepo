pipeline {
    agent any
    tools{
        maven 'maven_3_6_8'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'ec679280-23ac-42c3-86f6-1e8f279559b2', url: 'https://github.com/Zaki-Essay/DevOpsRepo']]])
                sh 'mvn clean install'
            }
        }

        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t zikossy/spring-image --force-rm .'
                }
            }
        }

        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'DOCKER_HUB_PWD')])  {
                   sh 'docker login -u zikossy -p ${DOCKER_HUB_PWD}'

                }
                   sh 'docker push zikossy/spring-image'
                }
            }
        }

        stage('Deploy to k8s'){
                    steps{
                        script{
                            kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
                        }
                    }
        }
    }



}