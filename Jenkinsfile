pipeline{
    agent any
    tools {

    }
    
    stages {       
        stage('Git Fetch') {
            steps {
                checkout changelog: false, poll: false, 
                scm: scmGit(
                    branches: [[name: '*/master']], 
                    extensions: [], userRemoteConfigs: 
                    [[credentialsId: '0b425ab5-4b9b-4193-a76a-ea3f302d97db', 
                    url: 'https://github.com/anileppakayala88/demo-twotier-dep.git']
                    ]
                )       
            }
        }

        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform apply'){
            steps {
                sh 'terraform apply --auto-approve'
            }
        }

        // stage('Deploy') {
        //     steps{
        //         sh 'cp ./index.html /var/lib/tomcat10/webapps/ROOT/'
        //     }
        }
    }



}