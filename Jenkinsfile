node{
   def app
   stage(" Code Checkout"){
      echo 'App build started..'
      git credentialsId: 'githubID', url: 'https://github.com/situnsjs/my-dockerbuild.git'
      }
   
   stage('Docker Build') {
     app = docker.build "situnsjs/go-docker"
    }
   
   stage("Tag & Push image"){
      withDockerRegistry([credentialsId: 'dockerID',url: ""]) {
          sh 'docker tag situnsjs/go-docker situnsjs/go-docker:dev'
          sh 'docker push situnsjs/go-docker:dev'
          sh 'docker push situnsjs/go-docker:latest'
      }
    }
    stage("App deployment started"){
     //sh 'oc login --token=t01XSPheqChA1n1QxmPCSJAwm5rFNYzb7FvRP9mmg6A --server=https://api.us-east-1.online-starter.openshift.com:6443'
          // sh 'oc new-project creativetech'
      
    // sh 'oc new-app shiddu/pythonimage:dev --name python --env NEWRELIC_LICENSE=xxxxxx NEWRELIC_APPNAME=pyapp'
    // sh 'oc expose svc python --name=python'
    // sh 'oc status'
    }
   
    stage('App deployed to Openshift environment') {
     echo 'App deployed to Openshift environment..'
    }
