setClass("PkgSeed",
         representation=representation(
           name="character",
           version="character",
           license="character",
           author="character",
           email="character",
           url="character",
           biocViews="character"),
         prototype=prototype(
           license="Artistic License, Version 2.0"),
         validity=function(object) .isValidPkgSeed(object))

setClass("PDInfoPkgSeed",
         contains="PkgSeed",
         representation=representation(
           chipName="character",
           manufacturer="character",
           genomebuild="character",
           pdInfoObjectName="character",
           geometry="integer"))

setClass("AffySNPPDInfoPkgSeed",
         contains="PDInfoPkgSeed",
         representation=representation(
           cdfFile="character",
           csvAnnoFile="character",
           csvSeqFile="character"
           ),
         prototype=list(manufacturer="Affymetrix"))


.isValidPkgSeed <- function(object) {
    email <- object@email
    if (length(email) != 1 || grep("@", email) != 1)
      return("invalid email address")
    TRUE
}