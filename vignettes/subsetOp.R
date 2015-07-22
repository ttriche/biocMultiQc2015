require(ozymandias)

## integrity-preserving subset operation for MultiAssayExperiment
setMethod("[", c("MultiAssayExperiment", "ANY", "ANY"),
          function(x, i, j, ..., drop=TRUE) {
            ## Only if perSampleMetadata isn't empty and j is set
            if (!missing(j) && length(x@perSampleMetadata) > 0) {
              x@perSampleMetadata <- lapply(x@perSampleMetadata,
                                            function(z) z[,j])
            }
            callNextMethod()
          })
