#!/bin/bash
set -euo pipefail

BUCKET="gs://fc-9169fcd1-92ce-4d60-9d2d-d19fd326ff10"  # terra-notebook-utils-tests workspace bucket

jq -n --arg bucket "${BUCKET}" '."xVCFSubsampleWorkflow.xVCFSubsample.input_file"="\($bucket)/test_xvcfsubsample/input.vcf.gz"' \
 | jq --arg bucket "${BUCKET}" '."xVCFSubsampleWorkflow.xVCFSubsample.output_file"="\($bucket)/test_xvcfsubsample/output.vcf.gz"' \
 | jq '."xVCFSubsampleWorkflow.xVCFSubsample.samples"="NA18952,NA18567,NA20847,HG00188"' > tests/input.json

gsutil cp "tests/fixtures/test.vcf.gz" "${BUCKET}/test_xvcfsubsample/input.vcf.gz"
java -jar "cromwell.jar" run "vcf_subsample.wdl" --inputs "tests/input.json"
