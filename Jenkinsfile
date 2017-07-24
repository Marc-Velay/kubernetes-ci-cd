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
        //env.TOKEN="hbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQtdG9rZW4tdjMwemMiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjlmMGQ2OTVmLTZjYTQtMTFlNy1hM2ExLTAwMGMyOWRkMzYyYSIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZ//WZhdWx0OmRlZmF1bHQifQ.AtVv2QHmCX07iJiqalRqYMRKwQ_dSoU5i6DSw8c9Ye3ANCyyIBOph3K8n1-lG85DZv9f1I4G6Ddo7r6fqA_knj3f57DYwByHYiXRI36HHvGEb_AC6gUUZzEmuIC0hbQIlnffGy_nGPrKR5BWVmZe925WN9kZIABn5OR-0eX_KeF30d8-n0qbBngkviREU4HDfFNGOTnCRt-_CXCY76isd9_cIYevpWw1ELD3B7NTxqfCaut-4hVIttzrjEoI4byt5dOVzHmAV_NhOcWTQfPX0JV12Xyag8rke8g-3ma-BN25fz8MIv7LHcniv9yqaZDP-wRMmiaByGIUdsXfJ4yvCA"
        //sh '''kubectl config set-credentials user --token=${TOKEN}'''
        //sh "curl -k -H \"Authorization:Bearer ${TOKEN}\" https://10.96.0.1"
        //sh "kubectl --token=${TOKEN} get pods"
        //sh "kubectl -n kube-system get secret clusterinfo -o yaml | grep token-map | awk '{print $2}' | base64 -d | sed "s|{||g;s|}||g;s|:|.|g;s/\"//g;" | xargs echo"
    stage "Deploy"
        //sh '''curl -v --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H \"Authorization: Bearer `cat /var/run/secrets/kubernetes.io/serviceaccount/token`\" https://10.96.0.1/  && sed 's#127.0.0.1:30400/hello-kenzan:latest#'$BUILDIMG'#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -'''
        //sh ''' kubectl config set-credentials kube-admin --token=${TOKEN} && kubectl apply -f applications/hello-kenzan/k8s/deployment.yaml --username kube-admin'''
        //sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#'$BUILDIMG'#' applications/hello-kenzan/k8s/deployment.yaml | kubectl apply -f -"
        //env.TOKEN=${sh '''kubectl exec jenkins-1385064901-t4vv4 -- cat /var/run/secrets/kubernetes.io/serviceaccount/token'''}
        sh ''' cat /var/run/secrets/kubernetes.io/serviceaccount/token > token '''
        env.TOKEN=readFile('token').trim()
        //sh "kubectl apply -f applications/hello-kenzan/k8s/deployment.yaml --as=kubernetes-admin --token=${TOKEN}"
        //sh "sed 's#127.0.0.1:30400/hello-kenzan:latest#'$BUILDIMG'#' applications/hello-kenzan/k8s/deployment.yaml >> tmpfile"
        //sh "cat applications/hello-kenzan/k8s/deployment.yaml > tmpfile"
        //def lastoutput=readFile('tmpfile')
        //sh "echo ${lastoutput}"
        sh '''kubectl apply --as=adm -f  ./applications/hello-kenzan/k8s/ '''
        sh "kubectl rollout status deployment/hello-kenzan --as=kubernetes-admin --token=${TOKEN}"
}
