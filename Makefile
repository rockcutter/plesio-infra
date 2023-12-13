.PHONY: generate_manifest

DOCKER_TAG = ''
_DOCKER_TAG = ''

ifneq ($(DOCKER_TAG),'')
	_DOCKER_TAG = ':$(DOCKER_TAG)'
endif

generate_manifest:
	cat template/manifest/server/k8s/server.yml | sed s/DOCKER_TAG/$(_DOCKER_TAG)/ > manifest/server/k8s/server.yml
	cp template/manifest/server/k8s/loadbalancer.yml manifest/server/k8s/loadbalancer.yml

##### git

commit:
	npx git-cz

