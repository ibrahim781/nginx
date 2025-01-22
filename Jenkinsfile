pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        
      }
    }
    stage ('Publish ECR') {
      steps {
        withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${nev.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr get-login-password --region us-east-1) 343218187259.dkr.ecr.us-east-1.amazonaws.com'
          sh 'docker build -t nginx-repo .'
          sh 'docker tag nginx-repo:""$BUILD_ID""'
          sh 'docker push 343218187259.dkr.ecr.us-east-1.amazonaws.com/nginx-repo:""$BUILD_ID""'
        }
      }
    }
  }
}
