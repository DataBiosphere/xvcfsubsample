include common.mk

test: lint plugin
	###############################################################
	# "This does NOT test DRS resolved VCF workflows."            #
	# "Please make sure `make test_drs` passes prior to release." #
	###############################################################
	gsutil cp tests/fixtures/multisample.vcf.gz gs://fc-9169fcd1-92ce-4d60-9d2d-d19fd326ff10/test_subsample_vcfs/multisample.vcf.gz
	miniwdl run --verbose --copy-input-files vcf_subsample.wdl --input tests/gs.json

test_drs: lint plugin
	miniwdl run --verbose --copy-input-files vcf_subsample.wdl --input tests/drs.json

test_broken: lint plugin
	# This should NOT hang forever
	gsutil cp tests/fixtures/broken.vcf.gz gs://fc-9169fcd1-92ce-4d60-9d2d-d19fd326ff10/test_subsample_vcfs/broken.vcf.gz
	miniwdl run --verbose --copy-input-files vcf_subsample.wdl --input tests/broken.json

plugin:
	pip install --upgrade --no-cache-dir tests/infra/inject_gs_credentials

lint:
	miniwdl check --strict vcf_subsample.wdl

clean:
	git clean -dfx

.PHONY: test test_drs plugin lint clean
