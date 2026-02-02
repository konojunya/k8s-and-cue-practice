package hello

deployment: #Deployment & {
	metadata: name: "hello-server"
	spec: {
		selector: matchLabels: app: "hello-server"

		template: {
			metadata: labels: app: "hello-server"

			spec: containers: [
				{
					name:  "hello-server"
					image: "hello-server:latest"
					ports: [{containerPort: 8080}]
					resources: requests: cpu: "1m"
				},
			]
		}
	}
}

service: #Service & {
	metadata: name: "hello-server"
	spec: {
		ports: [{port: 80, targetPort: 8080}]
		selector: app: "hello-server"
	}
}

ingress: #Ingress & {
	metadata: name: "hello-server"
	spec: rules: [{
		http: paths: [{
			path:     "/"
			pathType: "Prefix"
			backend: service: {
				name: "hello-server"
				port: number: 80
			}
		}]
	}]
}

hpa: #HPA & {
	metadata: name: "hello-server"
	spec: {
		scaleTargetRef: {
			apiVersion: "apps/v1"
			kind:       "Deployment"
			name:       "hello-server"
		}
		metrics: [{
			type: "Resource"
			resource: {
				name: "cpu"
				target: {
					type:               "Utilization"
					averageUtilization: 50
				}
			}
		}]
	}
}
