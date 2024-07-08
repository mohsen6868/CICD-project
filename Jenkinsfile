pipeline {
    agent any
    environment {
        VERSION = "$BUILD_NUMBER" + "-" + "$GIT_COMMIT"
    }
    
    stages {
        stage ('Clean workspaces') {
            steps {
                cleanWs()
            }
        }
        
        stage('Checkout Stage') {
            steps {
                git url: 'git@sgit.safirdev.ir:p.azaran/safirsite.git', branch: 'main'
            }
        }

        stage ('Docker build') {
            steps {
                sh 'docker --version'
                sh 'docker info'
                sh 'docker build -t safirsite -f Dockerfile .'
            }
        }

        stage ('Tag and Push Docker Image to Repository') {
            steps {
                sh 'docker image tag safirsite arti.safirdev.ir/docker-local/safirsite:$VERSION'
                sh 'docker image push arti.safirdev.ir/docker-local/safirsite:$VERSION'
            }
        }
        
        stage ('Deploy app to kubernetes') {
            steps {
                sh 'kubectl apply -f safirsite-kubernetes.yaml'
                sh 'kubectl rollout restart deployment -n live safirsite'
                sh 'kubectl set image -n live deployment/safirsite safirsite=arti.safirdev.ir/docker-local/safirsite:$VERSION'
            }
            }
    }
}
