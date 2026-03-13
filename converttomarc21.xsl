<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:marc="http://www.loc.gov/MARC21/slim"
 exclude-result-prefixes="marc">

<xsl:output method="xml" indent="yes"/>

<!-- Root -->
<xsl:template match="/">
 <marc:collection xmlns:marc="http://www.loc.gov/MARC21/slim">
  <xsl:apply-templates select="//marc:record"/>
 </marc:collection>
</xsl:template>

<!-- Record -->
<xsl:template match="marc:record">

 <marc:record>

  <!-- copy leader -->
  <xsl:copy-of select="marc:leader"/>

  <!-- copy control fields -->
  <xsl:copy-of select="marc:controlfield"/>

  <!-- ISBN 010 → 020 -->
  <xsl:for-each select="marc:datafield[@tag='010']">
   <marc:datafield tag="020" ind1=" " ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

  <!-- Language 101 → 041 -->
  <xsl:for-each select="marc:datafield[@tag='101']">
   <marc:datafield tag="041" ind1="0" ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

  <!-- Country 102 → 044 -->
  <xsl:for-each select="marc:datafield[@tag='102']">
   <marc:datafield tag="044" ind1=" " ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

  <!-- Author 700 → 100 -->
 <xsl:for-each select="marc:datafield[@tag='700']">
 <marc:datafield tag="100" ind1="1" ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='b']"/>
  </marc:subfield>
  <marc:subfield code="c">
   <xsl:value-of select="marc:subfield[@code='c']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='f']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Added Entry Personal Name 701 → 700 -->
<xsl:for-each select="marc:datafield[@tag='701']">
 <marc:datafield tag="700" ind1="1" ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='b']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='f']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

 <!-- Added Entry Personal Name 702 → 700 -->
<xsl:for-each select="marc:datafield[@tag='702']">
 <marc:datafield tag="700" ind1="1" ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='b']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='f']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

 <!-- Main Entry Corporate Name 710 → 110 -->
<xsl:for-each select="marc:datafield[@tag='710']">
 <marc:datafield tag="110" ind1="2" ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='b']"/>
  </marc:subfield>
  <marc:subfield code="c">
   <xsl:value-of select="marc:subfield[@code='c']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='d']"/>
  </marc:subfield>
  <marc:subfield code="f">
   <xsl:value-of select="marc:subfield[@code='f']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

<!-- secondary Entry Corporate Name 711 → 710 -->
<xsl:for-each select="marc:datafield[@tag='711']">
 <marc:datafield tag="710" ind1="2" ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='b']"/>
  </marc:subfield>
  <marc:subfield code="c">
   <xsl:value-of select="marc:subfield[@code='c']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='d']"/>
  </marc:subfield>
  <marc:subfield code="f">
   <xsl:value-of select="marc:subfield[@code='f']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Title 200 → 245 -->
  <xsl:for-each select="marc:datafield[@tag='200']">
   <marc:datafield tag="245" ind1="1" ind2="0">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
    <marc:subfield code="c">
     <xsl:value-of select="marc:subfield[@code='f']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>


  <!-- Edition 205 → 250 -->
  <xsl:for-each select="marc:datafield[@tag='205']">
   <marc:datafield tag="250" ind1=" " ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

  <!-- Publication 210 → 264 -->
  <xsl:for-each select="marc:datafield[@tag='210']">
   <marc:datafield tag="264" ind1=" " ind2="1">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
    <marc:subfield code="b">
     <xsl:value-of select="marc:subfield[@code='c']"/>
    </marc:subfield>
    <marc:subfield code="c">
     <xsl:value-of select="marc:subfield[@code='d']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

  <!-- Physical description 215 → 300 -->
  <xsl:for-each select="marc:datafield[@tag='215']">
   <marc:datafield tag="300" ind1=" " ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
    <marc:subfield code="c">
     <xsl:value-of select="marc:subfield[@code='d']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>


  <!-- Series 225 → 490 -->
  <xsl:for-each select="marc:datafield[@tag='225']">
   <marc:datafield tag="490" ind1="1" ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
    <marc:subfield code="v">
     <xsl:value-of select="marc:subfield[@code='v']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

  <!-- Series access 410 → 830 -->
  <xsl:for-each select="marc:datafield[@tag='410']">
   <marc:datafield tag="830" ind1=" " ind2="0">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

  <!-- Supplement parent entry 421 → 772 -->
<xsl:for-each select="marc:datafield[@tag='421']">
 <marc:datafield tag="772" ind1="0" ind2=" ">
  <marc:subfield code="i">
   <xsl:value-of select="marc:subfield[@code='i']"/>
  </marc:subfield>
  <marc:subfield code="t">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="c">
   <xsl:value-of select="marc:subfield[@code='c']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='d']"/>
  </marc:subfield>
  <marc:subfield code="g">
   <xsl:value-of select="marc:subfield[@code='h']"/>
  </marc:subfield>
  <marc:subfield code="q">
   <xsl:value-of select="marc:subfield[@code='v']"/>
  </marc:subfield>
  <marc:subfield code="x">
   <xsl:value-of select="marc:subfield[@code='x']"/>
  </marc:subfield>
  <marc:subfield code="z">
   <xsl:value-of select="marc:subfield[@code='y']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

<!-- general note 300 → 500 -->
  <xsl:for-each select="marc:datafield[@tag='300']">
   <marc:datafield tag="830" ind1=" " ind2="">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

<!-- parallel Title 311 → 246 -->
 <xsl:for-each select="marc:datafield[@tag='311']">
 <marc:datafield tag="246" ind1="3" ind2="1">
  <marc:subfield code="i">
   <xsl:value-of select="marc:subfield[@code='i']"/>
  </marc:subfield>
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='e']"/>
  </marc:subfield>
  <marc:subfield code="n">
   <xsl:value-of select="marc:subfield[@code='v']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Frequancy 326 → 310 -->
<xsl:for-each select="marc:datafield[@tag='326']">
 <marc:datafield tag="310" ind1=" " ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='b']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Content Note 327 → 505 -->
<xsl:for-each select="marc:datafield[@tag='327']">
 <marc:datafield tag="505" ind1="0" ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Type of computer file or data note 336 → 516 -->
<xsl:for-each select="marc:datafield[@tag='336']">
 <marc:datafield tag="516" ind1=" " ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Translation of another work 454 → 765 -->
<xsl:for-each select="marc:datafield[@tag='454']">
 <marc:datafield tag="765" ind1="0" ind2=" ">
  <marc:subfield code="i">
   <xsl:value-of select="marc:subfield[@code='i']"/>
  </marc:subfield>
  <marc:subfield code="t">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="c">
   <xsl:value-of select="marc:subfield[@code='c']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='d']"/>
  </marc:subfield>
  <marc:subfield code="g">
   <xsl:value-of select="marc:subfield[@code='h']"/>
  </marc:subfield>
  <marc:subfield code="q">
   <xsl:value-of select="marc:subfield[@code='v']"/>
  </marc:subfield>
  <marc:subfield code="x">
   <xsl:value-of select="marc:subfield[@code='x']"/>
  </marc:subfield>
  <marc:subfield code="z">
   <xsl:value-of select="marc:subfield[@code='y']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Parent work_set 461 → 773 -->
<xsl:for-each select="marc:datafield[@tag='461']">
 <marc:datafield tag="773" ind1="0" ind2=" ">
  <marc:subfield code="t">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="c">
   <xsl:value-of select="marc:subfield[@code='c']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='d']"/>
  </marc:subfield>
  <marc:subfield code="g">
   <xsl:value-of select="marc:subfield[@code='h']"/>
  </marc:subfield>
  <marc:subfield code="q">
   <xsl:value-of select="marc:subfield[@code='v']"/>
  </marc:subfield>
  <marc:subfield code="x">
   <xsl:value-of select="marc:subfield[@code='x']"/>
  </marc:subfield>
  <marc:subfield code="z">
   <xsl:value-of select="marc:subfield[@code='y']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Uniform Title 500 → 240 -->
<xsl:for-each select="marc:datafield[@tag='500']">
 <marc:datafield tag="240" ind1="1" ind2="0">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="p">
   <xsl:value-of select="marc:subfield[@code='e']"/>
  </marc:subfield>
  <marc:subfield code="l">
   <xsl:value-of select="marc:subfield[@code='m']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Variant Titles 517 → 246 -->

<xsl:for-each select="marc:datafield[@tag='517']">
 <marc:datafield tag="246" ind1="3" ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='e']"/>
  </marc:subfield>
  <marc:subfield code="n">
   <xsl:value-of select="marc:subfield[@code='v']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Personal name subject 600 → 600 -->
<xsl:for-each select="marc:datafield[@tag='600']">
 <marc:datafield tag="600" ind1="1" ind2="0">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="b">
   <xsl:value-of select="marc:subfield[@code='b']"/>
  </marc:subfield>
  <marc:subfield code="d">
   <xsl:value-of select="marc:subfield[@code='f']"/>
  </marc:subfield>
  <marc:subfield code="x">
   <xsl:value-of select="marc:subfield[@code='x']"/>
  </marc:subfield>
  <marc:subfield code="y">
   <xsl:value-of select="marc:subfield[@code='y']"/>
  </marc:subfield>
  <marc:subfield code="z">
   <xsl:value-of select="marc:subfield[@code='z']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Topical subject 606 → 650 -->
<xsl:for-each select="marc:datafield[@tag='606']">
 <marc:datafield tag="650" ind1=" " ind2="0">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="x">
   <xsl:value-of select="marc:subfield[@code='x']"/>
  </marc:subfield>
  <marc:subfield code="y">
   <xsl:value-of select="marc:subfield[@code='y']"/>
  </marc:subfield>
  <marc:subfield code="z">
   <xsl:value-of select="marc:subfield[@code='z']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Geographic Name 607 → 651 -->
<xsl:for-each select="marc:datafield[@tag='607']">
 <marc:datafield tag="651" ind1=" " ind2="0">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
  <marc:subfield code="x">
   <xsl:value-of select="marc:subfield[@code='x']"/>
  </marc:subfield>
  <marc:subfield code="y">
   <xsl:value-of select="marc:subfield[@code='y']"/>
  </marc:subfield>
  <marc:subfield code="z">
   <xsl:value-of select="marc:subfield[@code='z']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Uncontrolled subject term 610 → 653 -->
<xsl:for-each select="marc:datafield[@tag='610']">
 <marc:datafield tag="653" ind1=" " ind2=" ">
  <marc:subfield code="a">
   <xsl:value-of select="marc:subfield[@code='a']"/>
  </marc:subfield>
 </marc:datafield>
</xsl:for-each>

  <!-- Cataloging source 801 → 040 -->
  <xsl:for-each select="marc:datafield[@tag='801']">
   <marc:datafield tag="040" ind1=" " ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='b']"/>
    </marc:subfield>
    <marc:subfield code="c">
     <xsl:value-of select="marc:subfield[@code='b']"/>
    </marc:subfield>
   </marc:datafield>
  </xsl:for-each>

 <!-- Title Z30 → 901 -->
  <xsl:for-each select="marc:datafield[@tag='Z30']">
   <marc:datafield tag="901" ind1=" " ind2=" ">
   <marc:subfield code="l">
 <xsl:value-of select="marc:subfield[@code='l']"/>
</marc:subfield>
<marc:subfield code="L">
 <xsl:value-of select="marc:subfield[@code='L']"/>
</marc:subfield>
<marc:subfield code="m">
 <xsl:value-of select="marc:subfield[@code='m']"/>
</marc:subfield>
<marc:subfield code="1">
 <xsl:value-of select="marc:subfield[@code='1']"/>
</marc:subfield>
<marc:subfield code="A">
 <xsl:value-of select="marc:subfield[@code='A']"/>
</marc:subfield>
<marc:subfield code="2">
 <xsl:value-of select="marc:subfield[@code='2']"/>
</marc:subfield>
<marc:subfield code="B">
 <xsl:value-of select="marc:subfield[@code='B']"/>
</marc:subfield>
<marc:subfield code="3">
 <xsl:value-of select="marc:subfield[@code='3']"/>
</marc:subfield>
<marc:subfield code="9">
 <xsl:value-of select="marc:subfield[@code='9']"/>
</marc:subfield>
<marc:subfield code="6">
 <xsl:value-of select="marc:subfield[@code='6']"/>
</marc:subfield>
<marc:subfield code="5">
 <xsl:value-of select="marc:subfield[@code='5']"/>
</marc:subfield>
<marc:subfield code="f">
 <xsl:value-of select="marc:subfield[@code='f']"/>
</marc:subfield>
<marc:subfield code="F">
 <xsl:value-of select="marc:subfield[@code='F']"/>
</marc:subfield>
<marc:subfield code="n">
 <xsl:value-of select="marc:subfield[@code='n']"/>
</marc:subfield>
   </marc:datafield>
  </xsl:for-each>

 <!-- Title CAT → 902 -->
  <xsl:for-each select="marc:datafield[@tag='CAT']">
   <marc:datafield tag="902" ind1=" " ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
    <marc:subfield code="b">
     <xsl:value-of select="marc:subfield[@code='b']"/>
    </marc:subfield>
 <marc:subfield code="c">
     <xsl:value-of select="marc:subfield[@code='b']"/>
    </marc:subfield>
 <marc:subfield code="l">
     <xsl:value-of select="marc:subfield[@code='l']"/>
    </marc:subfield>  
 <marc:subfield code="h">
     <xsl:value-of select="marc:subfield[@code='h']"/>
    </marc:subfield> 
</marc:datafield>
  </xsl:for-each>

 <!-- Title FMT → 903 -->
  <xsl:for-each select="marc:datafield[@tag='FMT']">
   <marc:datafield tag="903" ind1=" " ind2=" ">
    <marc:subfield code="a">
     <xsl:value-of select="marc:subfield[@code='a']"/>
    </marc:subfield>
       </marc:datafield>
  </xsl:for-each>

 </marc:record>

</xsl:template>

</xsl:stylesheet>
