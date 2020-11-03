include common.mk

test: lint cromwell.jar
	tests/test_xvcfsubsample.sh

lint:
	miniwdl check --strict vcf_subsample.wdl

womtool.jar:
	wget -O womtool.jar https://github.com/broadinstitute/cromwell/releases/download/52/womtool-52.jar

cromwell.jar:
	wget -O cromwell.jar https://github.com/broadinstitute/cromwell/releases/download/52/cromwell-52.jar

clean:
	git clean -dfx

.PHONY: test lint clean
