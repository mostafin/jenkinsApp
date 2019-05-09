node {
  def acr = 'mycontainerdev.azurecr.io'
  def appName = 'trial'
  def imageName = "${acr}/${appName}"
  def imageTag = "${imageName}:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"
  def appRepo = "mycontainerdev.azurecr.io/trial:v1.0.0"
 
  checkout scm
 
 stage('Build the Image and Push to Azure Container Registry')
 {
   app = docker.build("${imageName}")
   withDockerRegistry([credentialsId: 'acr_auth', url: "https://${acr}"]) {
      app.push("${env.BRANCH_NAME}.${env.BUILD_NUMBER}")
                }
  }
 
 stage ("Deploy Application on Azure Kubernetes Service")
 {
  switch (env.BRANCH_NAME) {
    // Roll out to canary environment
    case "canary":
        // Change deployed image in canary to the one we just built
        sh("sed -i.bak 's#${appRepo}#${imageTag}#' ./k8s/canary/*.yaml")
        sh("kubectl --namespace=psrestapi-production apply -f k8s/canary/")
        sh("echo http://kubectl --namespace=psrestapi-production get service/${appName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip' > ${appName}")
        break
 
    // Roll out to production
    case "master":
        // Change deployed image in master to the one we just built
        sh("sed -i.bak 's#${appRepo}#${imageTag}#' ./k8s/production/*.yaml")
        sh("kubectl --namespace=psrestapi-production apply -f k8s/production/")
        sh("echo http://kubectl --namespace=psrestapi-production get service/${appName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip' > ${appName}")
        break
 
    // Roll out a dev environment
    default:
        // Create namespace if it doesn't exist
        sh("kubectl get ns ${appName}-${env.BRANCH_NAME} || kubectl create ns ${appName}-${env.BRANCH_NAME}")
        // Don't use public load balancing for development branches