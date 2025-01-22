pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'printenv'  // This prints out all environment variables
            }
        }
        stage('Publish ECR') {
            steps {
                withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", 
                         "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", 
                         "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
                    
                    // Authenticate to AWS ECR
                    sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 343218187259.dkr.ecr.us-east-1.amazonaws.com'
                    
                    // Build the Docker image
                    sh 'docker build -t nginx-repo .'
                    
                    // Tag the Docker image with the build ID
                    sh 'docker tag nginx-repo:"$BUILD_ID" 343218187259.dkr.ecr.us-east-1.amazonaws.com/nginx-repo:"$BUILD_ID"'
                    
                    // Push the Docker image to AWS ECR
                    sh 'docker push 343218187259.dkr.ecr.us-east-1.amazonaws.com/nginx-repo:"$BUILD_ID"'
                }
            }
        }
    }
}
