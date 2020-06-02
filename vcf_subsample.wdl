workflow xVCFSubsampleWorkflow {
	call xVCFSubsample
}

task xVCFSubsample {
	String input_file
	String output_file
	String samples
	runtime {
	    docker: "xbrianh/xsamtools"
		memory: "64G"
		cpu: "8"
	}
	command {
		xsamtools vcf subsample --input ${input_file} --output ${output_file} --samples ${samples}
	}
}
