<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://hl7.org/fhir"
    xmlns:svs="urn:ihe:iti:svs:2008"
    xmlns:set="http://exslt.org/sets"
    exclude-result-prefixes="xs"
    extension-element-prefixes="set"
    version="1.0">
    <xsl:output indent="yes"/>
    <xsl:variable name='cs' select='document("codesystems.xml")'/>
    <xsl:template match="/">
        <ValueSet xmlns="http://hl7.org/fhir">
            <!-- id value="dicom-cid-402-AuditActiveParticipantRoleIDCode"/ -->
            <!-- url value="http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_402.html"/ -->
            <identifier>
                <system value="urn:ietf:rfc:3986"/>
                <value value="urn:oid:{/svs:RetrieveValueSetResponse/svs:ValueSet/@id}"/>
            </identifier>
            <version value="{/svs:RetrieveValueSetResponse/svs:ValueSet/@version}"/>
            <name value="{translate(/svs:RetrieveValueSetResponse/svs:ValueSet/@displayName,' -/.','_')}"/>
            <title value="{/svs:RetrieveValueSetResponse/svs:ValueSet/@displayName}"/>
            <!-- These two are best guess, we don't really know -->
            <status value="active"/>
            <experimental value="false"/>
            <!-- date value="2020-03-16"/ -->
            <!-- publisher value="NEMA MITA DICOM"/-->
            <!-- description value="Transitive closure of CID 402 AuditActiveParticipantRoleIDCode"/ -->
            <!-- copyright value="© 2020 NEMA"/ -->
            <compose>
                <xsl:for-each select="set:distinct(//svs:concept/@codeSystem)">
                    <include>
                        <system value='{$cs/codesystems/codesystem[@oid=current()]/@uri}'/>
                        <xsl:for-each select="//svs:concept[@codeSystem=current()]">
                            <concept>
                                <code value='{@code}'/>
                                <display value='{@displayName}'/>
                            </concept>
                        </xsl:for-each>
                    </include>    
                </xsl:for-each>
            </compose>
        </ValueSet>
    </xsl:template>
</xsl:stylesheet>