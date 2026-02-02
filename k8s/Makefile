.PHONY: lint/dev
lint/dev:
	@cue vet ./... -t dev

.PHONY: lint/prod
lint/prod:
	@cue vet ./... -t prod

.PHONY: format
format:
	@cue fmt ./...

.PHONY: gen/dev/deployment
gen/dev/deployment:
	@cue export ./... -t dev -e deployment --out yaml

.PHONY: gen/dev/service
gen/dev/service:
	@cue export ./... -t dev -e service --out yaml

.PHONY: gen/prod/deployment
gen/prod/deployment:
	@cue export ./... -t prod -e deployment --out yaml

.PHONY: gen/prod/service
gen/prod/service:
	@cue export ./... -t prod -e service --out yaml
