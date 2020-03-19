<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:variable name="infoPatient" select="document('cabinet_output.xml', /)/patient"/>
    <xsl:param name="destinedName" select="'Alécole'"/> 
    
    <xsl:template match="/">
        <html>
            <head>
                <title>test.xsl</title>
                <link rel="stylesheet" type="text/css" href="cabinet.css"/>

            </head>
            <body>
                <xsl:apply-templates select="$infoPatient"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="patient">
        <h2>Vos informations personnelles </h2>
        <div id="infoPatient">
            <p class="titre"> </p>
            <p>
                <span class="titre">Nom : </span> 
                <xsl:value-of select="nom"/>
            </p>
            <p> 
                <span class="titre">Prenom :</span> 
                <xsl:value-of select="prénom"/>
            </p>
            <p> 
                <span class="titre">sexe :</span> 
                <xsl:value-of select="sexe"/>
            </p>
            <p> 
                <span class="titre">naissance :</span> 
                <xsl:value-of select="naissance"/>
            </p>
            <p> 
                <span class="titre">numero : </span> 
                <xsl:value-of select="numéro"/>
            </p>
            <p class="titre">Adresse</p>
            <ul>
                <li>Etage : <xsl:value-of select="adresse/étage"/></li>
                <li>Numéro : <xsl:value-of select="adresse/numéro"/></li>
                <li>rue : <xsl:value-of select="adresse/rue"/></li>
                <li>ville : <xsl:value-of select="adresse/ville"/></li>
                <li>code Postal :<xsl:value-of select="adresse/codePostal"/></li>
            </ul>
        </div>
        
        <h2>Mes visites</h2>
        <table id="visitesPatient" >
            <tr>
                <td class="titre">Intervenant</td>
                <td class="titre">Soin a realiser</td>
            </tr>
            <xsl:apply-templates select="visite"/>
        </table>
    </xsl:template>

    <xsl:template match="visite">
        <tr>
            <td>
                <xsl:value-of select="intervenant/nom/text()"/> 
                <xsl:value-of select="intervenant/prénom/text()"/> 
            </td>
            <td>
                <xsl:value-of select="acte/text()"/> 
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
