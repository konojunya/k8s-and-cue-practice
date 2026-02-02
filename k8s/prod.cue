@if(prod)
package hello

deployment: spec: {
	replicas: 3
	template: spec: containers: [{imagePullPolicy: "Always"}]
}

service: spec: type: "LoadBalancer"

ingress: spec: rules: [{host: "hello.example.com"}]
