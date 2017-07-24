node {

    checkout scm

    env.DOCKER_API_VERSION="1.23"

    sh "git rev-parse --short HEAD > commit-id"

    //tag = readFile('commit-id').replace("\n", "").replace("\r", "")
    tag = "latest"
    appName = "hello-kenzan"
    registryHost = "127.0.0.1:30400/"
    imageName = "${registryHost}${appName}:${tag}"
    env.BUILDIMG=imageName

    stage "Build"

        sh "docker build -t ${imageName} -f applications/hello-kenzan/Dockerfile applications/hello-kenzan"

    stage "Push"

        sh "docker push ${imageName}"

    stage "Deploy"

        sh '''export KUBECONFIG=/data/jenkins/config \
            && kubectl apply -f  ./applications/hello-kenzan/k8s/ \
            && kubectl rollout status deployment/hello-kenzan '''
}
