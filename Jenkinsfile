node {

    checkout scm

        stage('Build') {
            sh("sudo kubectl get all")
        }
        stage('Test') {
                echo 'Testing..'
        }
        stage('Deploy') {
                echo 'Deploying....'
        }
}