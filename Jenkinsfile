pipeline {
    agent { label 'docker' }
    options {
        buildDiscarder(logRotator(numToKeepStr:'30', artifactNumToKeepStr:'10'))
    }
    stages {
        stage('Deploy Helm Charts') {
            agent { 
                dockerfile { 
                    args '-u 0:0' 
                } 
            }
            when {
                branch 'main'
            }
            environment {
                HELM_EXPERIMENTAL_OCI = 1
                HELM_REPO = 'https://harbor.internal.shared.empathy.co/chartrepo/empathyco'
                HELM_REPO_URL="harbor.internal.shared.empathy.co/platform/public-charts"

                // Pipe ("|") separeted list of helm charts that are needed to be pushed to harbor. The rest will be available in the repo as public charts.
                // E.g:
                // HELM_CHARTS_TO_HARBOR="elasticsearch-umbrella|cerebro"
                HELM_CHARTS_TO_HARBOR="elasticsearch-umbrella"
            }
            steps {
                script {
                    sh "helm plugin install https://github.com/chartmuseum/helm-push"
                    withCredentials([usernamePassword(credentialsId: 'harbor-credentials', usernameVariable: 'username', passwordVariable: 'password')]) {
                        sh '''
                            helm registry login ${HELM_REPO_URL} --username ${username} --password ${password}
                            for chart in $(ls -1 ./charts | grep -E ${HELM_CHARTS_TO_HARBOR})
                            do
                                VERSION=$(yq eval .version ./charts/${chart}/Chart.yaml)
                                helm lint ./charts/${chart}
                                helm cm-push ./charts/${chart} ${HELM_REPO} -v ${VERSION} -u ${username} -p ${password}
                                helm chart save ./charts/${chart} ${HELM_REPO_URL}/${chart}:${VERSION}-chart
                                helm chart push ${HELM_REPO_URL}/${chart}:${VERSION}-chart
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
