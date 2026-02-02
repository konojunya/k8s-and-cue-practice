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
