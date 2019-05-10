node {
    def aks = "k8s-demo-dns-64ce94cd.hcp.northeurope.azmk8s.io"
    def servicePrincipalId = '<your-service-principal>'
    checkout scm

        stage('Apply Kubernetes files') {
            withKubeConfig([credentialsId: 'acr_auth', serverUrl: "https://${aks}"]) {
                sh 'kubectl apply -f my-kubernetes-directory/'
            }
        }
        stage('Test') {
                echo 'Testing..'
        }
        stage('Deploy') {
                echo 'Deploying....'
        }
}