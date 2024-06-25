pipeline{
    agent any

    environment {
        EC2_USER = "ubuntu"  //replace with your EC2 username
        // KEY_CREDENTIAL_ID = 'your-ssh-key-credential-id' // replace with your Jenkins SSH credential ID
        // AWS_CREDENTIALS_ID = 'your-aws-credentials-id' // replace with your Jenkins AWS credential ID
        REPO_URL = 'https://github.com/anileppakayala88/demo-twotier-dep.git' // replace with your Git repository URL
        FILE_PATH = 'path/to/your/file' // replace with the path to the file in the repo
    }
    
    stages {       
        stage('Git Fetch') {
            steps {
                checkout changelog: false, poll: false, 
                scm: scmGit(
                    branches: [[name: '*/main']], 
                    extensions: [], userRemoteConfigs: 
                    [[credentialsId: '0b425ab5-4b9b-4193-a76a-ea3f302d97db', 
                    url: "${REPO_URL}"]
                    ]
                )       
            }
        }

        stage('Terraform init') {
            steps {
                // withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                sh 'terraform init'
            // }
            }
        }

        stage('Terraform plan') {
            steps {
                // withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                sh 'terraform plan'
            // }
            }
        }

        stage('Terraform apply'){
            steps {
                // withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                sh 'terraform apply --auto-approve'
            // }
            }
        }

        stage('Get EC2 Instance IP'){
            steps {
                script{
                    env.EC2_IP = sh(script: 'terraform output -raw instance_ip', returnStdout: true).trim()
                    }
                }
            }
        }

        stage('SSH and ')       



        // stage('Terraform destroy'){
        //     steps {
        //         sh 'terraform destroy --auto-approve'
        //     }
        // }

    
    }
}
