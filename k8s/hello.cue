package hello

deployment: {
  apiVersion: "apps/v1"
  kind: "Deployment"
  spec: {
    replicas: 1
    selector: matchLabels: app: "hello-server"

    template: {
      metadata: labels: app: "hello-server"

      spec: containers: [
        {name: "hello-server", image: "hello-server:latest", ports: [{containerPort: 8080}], imagePullPolicy: "Never"}
      ]
    }
  }
  metadata: name: "hello-server"
}

service: {
  apiVersion: "v1"
  kind: "Service"
  metadata: name: "hello-server"
  spec: {
    type: "NodePort"
    ports: [{port: 80, targetPort: 8080}]
    selector: app: "hello-server"
  }
}
