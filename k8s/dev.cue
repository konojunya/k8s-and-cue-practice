@if(dev)
package hello

deployment: spec: {
	replicas: 1
	template: spec: containers: [{imagePullPolicy: "Never"}]
}

service: spec: type: "NodePort"

ingress: spec: rules: [{host: "hello.local"}]
