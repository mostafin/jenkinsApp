node {

    checkout scm

        stage('Build') {
            sh("kubectl get node")
        }
        stage('Test') {
                echo 'Testing..'
        }
        stage('Deploy') {
                echo 'Deploying....'
        }
}