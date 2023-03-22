nextflow.enable.dsl=2

include { ParseMetadataSWF as ParseMetadata } from "./subworkflows/input/ParseMetadataSWF.nf"
include { CurlFetchFastq                    } from "./modules/fetch/curl_fetch_fastq.nf"

workflow {
    ParseMetadata(
        file(params.metadata, checkIfExists: true)
    )
    CurlFetchFastq(
        ParseMetadata.out.fastqInfo_ch
    )
}
