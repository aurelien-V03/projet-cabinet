<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:cbn='http://montp/cabinet'
                  xmlns:act='http://www.ujf-grenoble.fr/l3miage/actes'
                version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:variable name="actes" select="document('actes.xml', /)/act:ngap"/>
    <xsl:param name="destinedName" select="'Alécole'"/>  
          
    <xsl:template match="/">
        
        <!--RACINE : patient -->
        <xsl:element name="patient">
            <xsl:apply-templates select="/cbn:cabinet/cbn:patients/cbn:patient"/>
        </xsl:element>
      
            
       
    </xsl:template>
    
    
    
    <xsl:template match="cbn:patient">
        <!-- Nom du patient courant -->
        <xsl:param name="currentName" select="cbn:nom"/>    
           

        <!-- On verifie que le nom du patient correspond au parametre $destinedName -->
        <xsl:if test="$currentName= $destinedName">       
            <xsl:element name="nom">
                <xsl:value-of select="cbn:nom"/>
            </xsl:element>    
            <xsl:element name="prénom">
                <xsl:value-of select="cbn:prénom"/>
            </xsl:element>    
                 
                 <xsl:element name="sexe">
                <xsl:value-of select="cbn:sexe"/>
            </xsl:element>   
            <xsl:element name="naissance">
                <xsl:value-of select="cbn:naissance"/>
            </xsl:element>     
            <xsl:element name="numéro">
                <xsl:value-of select="cbn:numéro"/>
            </xsl:element>    
            
            <xsl:element name="adresse">
                    <xsl:element name="étage">
                <xsl:value-of select="cbn:adresse/cbn:étage"/>
            </xsl:element>    
            <xsl:element name="numéro">
                <xsl:value-of select="cbn:adresse/cbn:numéro"/>
            </xsl:element>    
            <xsl:element name="rue">
                <xsl:value-of select="cbn:adresse/cbn:rue"/>
            </xsl:element>    
            <xsl:element name="ville">
                <xsl:value-of select="cbn:adresse/cbn:ville"/>
            </xsl:element>    
            <xsl:element name="codePostal">
                <xsl:value-of select="cbn:adresse/cbn:codePostal"/>
            </xsl:element>    
            </xsl:element>    
            
            <!-- Liste des visites du patients -->
            
            <xsl:apply-templates select="cbn:visite[@intervenant]">
                <xsl:sort select="@date"/>
            </xsl:apply-templates>
        </xsl:if>
            
       
         
       
        
    </xsl:template>

<!-- TEMPLATE : visire -->
    <xsl:template match="cbn:visite">
        <xsl:param name="idIntervenant" select="@intervenant"/>
        <xsl:param name="idActe" select="cbn:acte/@id"/>
        <xsl:element name="visite">
            <xsl:element name="intervenant">
                <xsl:element name="nom">
                         <xsl:value-of select="/cbn:cabinet/cbn:infirmiers/cbn:infirmier[@id=$idIntervenant]/cbn:nom"/>
                </xsl:element>
                <xsl:element name="prénom">
                         <xsl:value-of select="/cbn:cabinet/cbn:infirmiers/cbn:infirmier[@id=$idIntervenant]/cbn:prénom"/>
                </xsl:element>
            </xsl:element>
            
            <xsl:element name="acte">
                <xsl:value-of select="$actes/act:actes/act:acte[@id=$idActe]" />
            </xsl:element>   
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
