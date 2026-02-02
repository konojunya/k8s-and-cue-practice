.PHONY: lint/dev
lint/dev:
	@cue vet ./... -t dev

.PHONY: lint/prod
lint/prod:
	@cue vet ./... -t prod

.PHONY: format
format:
	@cue fmt ./...

.PHONY: gen/dev
gen/dev:
	cue export ./... -t dev -e deployment --out yaml

.PHONY: gen/prod
gen/prod:
	cue export ./... -t prod -e deployment --out yaml
