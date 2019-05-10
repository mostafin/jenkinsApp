node {

    checkout scm

        stage('Build') {
            sh("kubectl --kubeconfig ~mostafin/.kube/config get all")
        }
        stage('Test') {
                echo 'Testing..'
        }
        stage('Deploy') {
                echo 'Deploying....'
        }
}