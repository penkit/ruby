# macro to build specific version
define docker_build
	docker build --build-arg RUBY_VERSION=$1 \
	--tag penkit/ruby:$(shell echo "$1" | sed 's/-r[0-9]*$$//') .
endef

# macro to pull specific version
define docker_pull
	docker pull penkit/ruby:$(shell echo "$1" | sed 's/-r[0-9]*$$//')
endef

# macro to push specific version
define docker_push
	docker push penkit/ruby:$(shell echo "$1" | sed 's/-r[0-9]*$$//')
endef

# targets for building specific (or all) versions
build: pull/base $(addprefix build/,$(shell cat RUBY_VERSIONS)) ;
build/%:
	$(call docker_build,$*)

# targets for pulling specific (or all) versions
pull: $(addprefix pull/,$(shell cat RUBY_VERSIONS)) ;
pull/%:
	$(call docker_pull,$*)

# target for pulling base image
pull/base:
	docker pull penkit/alpine:3.5

push: $(addprefix push/,$(shell cat RUBY_VERSIONS)) ;
push/%:
	$(call docker_push,$*)
