<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:android="http://schemas.android.com/apk/res/android">

    <xsl:param name="MohoundAppKey"></xsl:param>

    <xsl:template match="meta-data[@android:name='MohoundAppKey']">
        <meta-data android:name="MohoundAppKey" android:value="{$MohoundAppKey}"/>
    </xsl:template>

    <xsl:param name="MohoundAppSecret"></xsl:param>

    <xsl:template match="meta-data[@android:name='MohoundAppSecret']">
        <meta-data android:name="MohoundAppSecret" android:value="{$MohoundAppSecret}"/>
    </xsl:template>

    <xsl:param name="MohoundDebugMode"></xsl:param>

    <xsl:template match="meta-data[@android:name='MohoundDebugMode']">
        <meta-data android:name="MohoundDebugMode" android:value="{$MohoundDebugMode}"/>
    </xsl:template>

    <!--    <xsl:strip-space elements="*" />-->
    <xsl:output indent="yes" />

    <xsl:template match="comment()" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
