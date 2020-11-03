version 1.0

task xVCFSubsample {
    input {
        String input_file
        String workspace
        String billing_project
        String output_file
	    Array[String] samples
    }
    runtime {
        docker: "xbrianh/xsamtools:v0.5.2"
        memory: "64G"
        cpu: "8"
    }
    command {
        export GOOGLE_PROJECT=${billing_project}
        export WORKSPACE_NAME=${workspace}
        xsamtools vcf subsample --input ${input_file} --output ${output_file} --samples ${sep="," samples}
    }
}

workflow xVCFSubsampleWorkflow {
    input {
        String input_file
        String workspace
        String billing_project
        String output_file
	    Array[String] samples
    }
    call xVCFSubsample { input: input_file=input_file,
                                workspace=workspace,
                                billing_project=billing_project,
                                output_file=output_file,
                                samples=samples }
}
