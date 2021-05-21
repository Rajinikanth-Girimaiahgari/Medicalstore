pipeline {

     agent {

        label "master"
    }
    tools{
        maven "maven"
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage("SonarQube Analysis") {
            steps {
                withSonarQubeEnv('sonar') {
                sh 'mvn sonar:sonar'
                  }
             }
           }

	//stage("Trigger Nexus Job"){
	  //  steps{
		//build wait: true, job: '/Ice-Cream-Nexus'
	    //}

//	 }

  	}

//	post {
  //        always {
	//	  archiveArtifacts artifacts: 'target/My-Ice-Cream-Flavour!.war'
      //       junit  'target/surefire-reports/*.xml'
           //  }
	//}

}
