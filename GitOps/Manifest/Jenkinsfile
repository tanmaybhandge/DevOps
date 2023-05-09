node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Update GIT') {
            script {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                        sh "git config user.email tanmay8928@gmail.com"
                        sh "git config user.name Tanmay"
                        //sh "git switch master"
                        sh ''' 
                              pwd
                              cd ./GitOps/Manifest
                              cat deployment.yaml
                              pwd
                              sed -i 's+tanmayb/images.*+tanmayb/images:${DOCKERTAG}+g' deployment.yaml
                              cat deployment.yaml
                              git add .
                              git commit -m 'Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}'
                              git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/kubernetesmanifest.git HEAD:main
                           '''
      }
    }
  }
}
}
