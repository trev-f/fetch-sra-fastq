workflow ParseMetadataSWF {
    take:
        metadata
    
    main:
        Channel
            .fromPath(metadata)
            .splitCsv(header:true, sep:'\t')
            .map { extractFastqInfo(it) }
            .set { fastqInfo }
        
        fastqInfo.view()
    
    emit:
        fastqInfo_ch = fastqInfo
}


def extractFastqInfo(LinkedHashMap row) {
    def fastqInfo = [:]
    fastqInfo.niceFilename = row['FastQ nice filename']
    fastqInfo.fastqUrl = row['FastQ URL']

    return fastqInfo
}
