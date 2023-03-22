process CurlFetchFastq {
    tag "${niceFilename}"

    publishDir "${params.readsOutDir}", mode: 'copy'

    container 'quay.io/biocontainers/sra-tools:3.0.3--h87f3376_0'

    input:
        tuple val(niceFilename), val(fastqUrl)
    
    output:
        path '*.f*q.gz', emit: fastq
    
    script:
        """
        curl -L ${fastqUrl} -o ${niceFilename}
        """
}
