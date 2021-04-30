//HELM VARIABLES
HELM_REPO = 'https://harbor.internal.shared.empathy.co/chartrepo/empathyco'
// oci charts only
HELM_REPO_URL="harbor.internal.shared.empathy.co/platform/public-charts"

pipeline {
    agent { label 'docker' }
    options {
        buildDiscarder(logRotator(numToKeepStr:'30', artifactNumToKeepStr:'10'))
    }
    stages {
        stage('Linting Helm Template') {
            agent { dockerfile true }
            environment {
                HELM_EXPERIMENTAL_OCI = 1
            }
            steps {
                script {
                    sh "helm plugin install https://github.com/chartmuseum/helm-push"
                    withCredentials([usernamePassword(credentialsId: 'harbor-credentials', usernameVariable: 'username', passwordVariable: 'password')]) {
                        sh '''
                            helm registry login ${HELM_REPO_URL} --username ${username} --password ${password}
                            dirs=(./charts/*/)
                            for element in "${dirs[@]}"
                            do
                                VERSION=$(yq -r .version ${element}Chart.yaml)
                                helm lint ${element}
                                helm push ${element} ${HELM_REPO} -v ${VERSION}
                                helm chart save ${element} ${HELM_REPO_URL}:${VERSION}-chart
                                helm chart push ${HELM_REPO_URL}:${VERSION}-chart
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
