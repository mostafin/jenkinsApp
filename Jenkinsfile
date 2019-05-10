node {

    checkout scm

        stage('Build') {
            sh("kubectl get all")
        }
        stage('Test') {
                echo 'Testing..'
        }
        stage('Deploy') {
                echo 'Deploying....'
        }
}