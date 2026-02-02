.PHONY: lint/dev
lint/dev:
	@cue vet ./... -t dev

.PHONY: lint/prod
lint/prod:
	@cue vet ./... -t prod

.PHONY: format
format:
	@cue fmt ./...

# Development
.PHONY: gen/dev/deployment
gen/dev/deployment:
	@cue export ./... -t dev -e deployment --out yaml

.PHONY: gen/dev/service
gen/dev/service:
	@cue export ./... -t dev -e service --out yaml

.PHONY: gen/dev/ingress
gen/dev/ingress:
	@cue export ./... -t dev -e ingress --out yaml

# Production
.PHONY: gen/prod/deployment
gen/prod/deployment:
	@cue export ./... -t prod -e deployment --out yaml

.PHONY: gen/prod/service
gen/prod/service:
	@cue export ./... -t prod -e service --out yaml

.PHONY: gen/prod/ingress
gen/prod/ingress:
	@cue export ./... -t prod -e ingress --out yaml

# Hosts
.PHONY: hosts/dev
hosts/dev:
	echo "$(minikube ip) hello.local" | sudo hostctl add k8s-dev

.PHONY: hosts/prod
hosts/prod:
	echo "$(minikube ip) hello.example.com" | sudo hostctl add k8s-prod
