node{
   
   stage(" Code Checkout"){
      echo 'App build started..'
      git credentialsId: 'githubID', url: 'https://github.com/itrainjaquar/python-docker-app-openshifts.git'
      }
   
   stage('Docker Build') {
     def app = docker.build "manee2k6/itrain-padman-py-app"
    }
   
   stage("Tag & Push image"){
      withDockerRegistry([credentialsId: 'dockerID',url: ""]) {
          sh 'docker tag manee2k6/itrain-padman-py-app manee2k6/itrain-padman-py-app:dev'
          sh 'docker push manee2k6/itrain-padman-py-app:dev'
          sh 'docker push manee2k6/itrain-padman-py-app:latest'
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
