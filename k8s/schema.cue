package hello

#Deployment: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata:   #Metadata
	spec:       #DeploymentSpec
}

#Metadata: {
	name:       string & =~"^[a-z][a-z0-9-]*$"
	namespace?: string
	labels?:    #Labels
}

#Labels: [string]: string

#DeploymentSpec: {
	replicas: int & >0 & <=10
	selector: matchLabels: #Labels
	template: {
		metadata: labels: #Labels
		spec: containers: [...#Container]
	}
}

#Container: {
	name:  string
	image: string
	ports?: [...#ContainerPort]
	imagePullPolicy?: "Always" | "Never" | "IfNotPresent"
}

#ContainerPort: {
	containerPort: int & >0 & <=65535
}

#Service: {
	apiVersion: "v1"
	kind:       "Service"
	metadata:   #Metadata
	spec: {
		type: "NodePort" | "LoadBalancer" | "ClusterIP"
		ports: [...#ServicePort]
		selector: #Labels
	}
}

#ServicePort: {
	port:        int & >0 & <=65535
	targetPort?: int & >0 & <=65535
	nodePort?:   int & >0 & <=65535
}

#Ingress: {
  apiVersion: "networking.k8s.io/v1"
  kind: "Ingress"
  metadata: #Metadata
  spec: #IngressSpec
}

#IngressSpec: {
  rules: [...#IngressRule]
}

#IngressRule: {
  host: string
  http: paths: [...#HTTPPath]
}

#HTTPPath: {
  path: string
  pathType: "Prefix" | "Exact" | "ImplementationSpecific"
  backend: service: {
    name: string
    port: number: int & >0 & <=65535
  }
}

#HPA: {
  apiVersion: "autoscaling/v2"
  kind: "HorizontalPodAutoscaler"
  metadata: #Metadata
  spec: #HPAConfig
}

#HPAConfig: {
  scaleTargetRef: {
    apiVersion: string
    kind: string
    name: string
  }
  minReplicas?: int & >=1
  maxReplicas: int & >=1
  metrics: [...#HPAMetric]
}

#HPAMetric: {
  type: "Resource" | "Pods" | "Object" | "External"
  resource?: {
    name: "cpu" | "memory"
    target: {
      type: "Utilization" | "AverageValue" | "AverageUtilization"
      averageUtilization?: int & >=1 & <=100
      averageValue?: string
    }
  }
}
