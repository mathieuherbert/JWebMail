<?xml version="1.0" encoding="UTF-8"?>
<!--
$Id: sendresult.xsl 126 2008-10-31 03:41:09Z unsaved $

Copyright 2008 by the JWebMail Development Team and Sebastian Schaffert.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

<!-- This template is part of the German translation -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:variable name="imgbase" select="/USERMODEL/STATEDATA/VAR[@name='img base uri']/@value"/>
  <xsl:variable name="base" select="/USERMODEL/STATEDATA/VAR[@name='base uri']/@value"/>
  <xsl:variable name="session-id" select="/USERMODEL/STATEDATA/VAR[@name='session id']/@value"/>

  <xsl:variable name="work" select="/USERMODEL/WORK/MESSAGE[position()=1]"/>

    <xsl:template match="/">

    <HTML>
      <HEAD>
        <TITLE>JWebMail Mailbox für <xsl:value-of select="/USERMODEL/USERDATA/FULL_NAME"/>: Ergebnis des Versendens</TITLE>
        <META CONTENT="AUTHOR" VALUE="Sebastian Schaffert"/>
        <META CONTENT="GENERATOR" VALUE="JWebMail 1.0.1 XSL"/>
      </HEAD>

      <BODY bgcolor="#ffffff">
        <TABLE WIDTH="100%" BGCOLOR="#eae723" BORDER="0" CELLSPACING="0" >
          <TR bgcolor="#dddddd">
            <TD VALIGN="CENTER" COLSPAN="2" WIDTH="30%"><IMG SRC="{$imgbase}/images/btn-compose.png" BORDER="0"/></TD>
            <TD VALIGN="CENTER" ALIGN="right" WIDTH="70%">
              <FONT SIZE="+2"><STRONG>Verschicke Nachricht</STRONG></FONT><BR/>
              <STRONG>Thema: </STRONG><xsl:value-of select="$work/HEADER/SUBJECT"/><BR/>
              <STRONG>An: </STRONG><xsl:value-of select="$work/HEADER/TO"/><BR/>
              <STRONG>Datum: </STRONG><xsl:value-of select="/USERMODEL/STATEDATA/VAR[@name='date']/@value"/>
            </TD>
          </TR>
          <TR>
            <TD COLSPAN="3" ALIGN="center"><STRONG>Ergebnisse der Auslieferung</STRONG></TD>
          </TR>
          <TR>
            <TD COLSPAN="2"><STRONG>Status</STRONG></TD>
            <TD><xsl:value-of select="/USERMODEL/STATEDATA/VAR[@name='send status']/@value"/></TD>
          </TR>

          <!-- Only show the section for valid addresses if there actually were any -->
          <xsl:if test="/USERMODEL/STATEDATA/VAR[@name='valid sent addresses']/@value != ''">
            <TR>
              <TD COLSPAN="3"><STRONG>ausgeliefert an</STRONG></TD>
            </TR>
            <TR>
              <TD WIDTH="8%"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
              <TD><EM>gültig</EM></TD>
              <TD><xsl:value-of select="/USERMODEL/STATEDATA/VAR[@name='valid sent addresses']/@value"/></TD>
            </TR>
          </xsl:if>

          <!-- Only show the section for invalid addresses if there actually were any -->
          <xsl:if test="/USERMODEL/STATEDATA/VAR[@name='valid unsent addresses']/@value != '' or /USERMODEL/STATEDATA/VAR[@name='invalid unsent addresses']/@value != ''">
            <TR>
              <TD COLSPAN="3"><STRONG>nicht ausgeliefert an</STRONG></TD>
            </TR>
            <xsl:if test="/USERMODEL/STATEDATA/VAR[@name='valid unsent addresses']/@value != ''">
              <TR>
                <TD WIDTH="8%"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
                <TD><EM>gültig</EM></TD>
                <TD><xsl:value-of select="/USERMODEL/STATEDATA/VAR[@name='valid unsent addresses']/@value"/></TD>
              </TR>
            </xsl:if>
            <xsl:if test="/USERMODEL/STATEDATA/VAR[@name='invalid unsent addresses']/@value != ''">
              <TR>
                <TD WIDTH="8%"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
                <TD><EM>ungültig</EM></TD>
                <TD><xsl:value-of select="/USERMODEL/STATEDATA/VAR[@name='invalid unsent addresses']/@value"/></TD>
              </TR>
            </xsl:if>
          </xsl:if>
        </TABLE>

        <A HREF="{$base}/compose?session-id={$session-id}&amp;continue=1"><IMG SRC="{$imgbase}/images/arrow-left.png" BORDER="0"/> Zurück zum Bearbeiten der Nachricht ...</A>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
