pipeline {
    agent { label 'docker' }
    options {
        buildDiscarder(logRotator(numToKeepStr:'30', artifactNumToKeepStr:'10'))
    }
    stages {
        stage('Linting Helm Template') {
            agent { 
                dockerfile { 
                    args '-u 0:0' 
                } 
            }
            environment {
                HELM_EXPERIMENTAL_OCI = 1
                HELM_REPO = 'https://harbor.internal.shared.empathy.co/chartrepo/empathyco'
                HELM_REPO_URL="harbor.internal.shared.empathy.co/platform/public-charts"
            }
            steps {
                script {
                    sh "helm plugin install https://github.com/chartmuseum/helm-push"
                    withCredentials([usernamePassword(credentialsId: 'harbor-credentials', usernameVariable: 'username', passwordVariable: 'password')]) {
                        sh '''
                            helm registry login ${HELM_REPO_URL} --username ${username} --password ${password}
                            for element in $(ls ./charts)
                            do
                                VERSION=$(yq eval .version ./charts/${element}/Chart.yaml)
                                helm lint ./charts/${element}
                                helm push ./charts/${element} ${HELM_REPO} -v ${VERSION} -u ${username} -p ${password}
                                helm chart save ./charts/${element} ${HELM_REPO_URL}/${element}:${VERSION}-chart
                                helm chart push ${HELM_REPO_URL}/${element}:${VERSION}-chart
                            done
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}