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
.PHONY: gen/dev
gen/dev:
	@rm -rf .hydrated/dev/*
	@make gen/dev/deployment > .hydrated/dev/manifest.yaml
	@echo "---" >> .hydrated/dev/manifest.yaml
	@make gen/dev/service >> .hydrated/dev/manifest.yaml
	@echo "---" >> .hydrated/dev/manifest.yaml
	@make gen/dev/ingress >> .hydrated/dev/manifest.yaml
	@echo "---" >> .hydrated/dev/manifest.yaml
	@make gen/dev/hpa >> .hydrated/dev/manifest.yaml

.PHONY: gen/dev/deployment
gen/dev/deployment:
	@cue export ./... -t dev -e deployment --out yaml

.PHONY: gen/dev/service
gen/dev/service:
	@cue export ./... -t dev -e service --out yaml

.PHONY: gen/dev/ingress
gen/dev/ingress:
	@cue export ./... -t dev -e ingress --out yaml

.PHONY: gen/dev/hpa
gen/dev/hpa:
	@cue export ./... -t dev -e hpa --out yaml

# Production
.PHONY: gen/prod
gen/prod:
	@rm -rf .hydrated/prod/*
	@make gen/prod/deployment > .hydrated/prod/manifest.yaml
	@echo "---" >> .hydrated/prod/manifest.yaml
	@make gen/prod/service >> .hydrated/prod/manifest.yaml
	@echo "---" >> .hydrated/prod/manifest.yaml
	@make gen/prod/ingress >> .hydrated/prod/manifest.yaml
	@echo "---" >> .hydrated/prod/manifest.yaml
	@make gen/prod/hpa >> .hydrated/prod/manifest.yaml

.PHONY: gen/prod/deployment
gen/prod/deployment:
	@cue export ./... -t prod -e deployment --out yaml

.PHONY: gen/prod/service
gen/prod/service:
	@cue export ./... -t prod -e service --out yaml

.PHONY: gen/prod/ingress
gen/prod/ingress:
	@cue export ./... -t prod -e ingress --out yaml

.PHONY: gen/prod/hpa
gen/prod/hpa:
	@cue export ./... -t prod -e hpa --out yaml

# Hosts
.PHONY: hosts/dev
hosts/dev:
	echo "$(minikube ip) hello.local" | sudo hostctl add k8s-dev

.PHONY: hosts/prod
hosts/prod:
	echo "$(minikube ip) hello.example.com" | sudo hostctl add k8s-prod
