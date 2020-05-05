# svstofhir
SvsToFHIR is a pair of XSLT converters that enable switching between the format used by the [IHE Sharing Value Sets (SVS)](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_TF_Vol2b.pdf#page=277) profile and the [FHIR ValueSet Resource](http://hl7.org/fhir/ValueSet) XML formats.

There are three components to the software:
* svstofhir.xslt  - The XSLT to convert from SVS format to FHIR
* fhirtosvs.xslt  - The XSLT to convert from FHIR format to SVS
* codesystems.xml - A translation table for converting some known OIDs to code systems.

There are four additional files:
* fhir-example-valueset.xml - An example ValueSet in FHIR Format
* svs-example-valueset.xml  - An example ValueSet in SVS Format (HTTP)
* svstofhir.fhir.xml        - Output from running svstofhir.xslt over the svs-example-valueset.xml file.
* fhirtosvs.svs.xml         - Output from running fhirtosvs.xslt over the fhir-example-valueset.xml file.

