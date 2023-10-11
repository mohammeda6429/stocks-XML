<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

    <html>
    <head></head>
        <body>
            <h2>Stock Information</h2>
            
            <table border="1">
            <tr><th colspan="5">Stock Information</th></tr>
                <tr>
                    <th>Company</th>
                    <th>Symbol</th>
                    <th>URL</th>
                    <th>Category</th>
                    <th>Current Price</th>
                </tr>
                <xsl:apply-templates select="portfolio/stock">
                    <xsl:sort select="sName"/>
                </xsl:apply-templates>
            </table>
        </body>
    </html>
</xsl:template>

    <xsl:template match="stock">

        <tr>
            <td><xsl:value-of select="sName"/></td>
            <td><xsl:value-of select="sName/@symbol"/></td>
            <td><a href="{link}"><xsl:value-of select="link"/></a></td>
            <td><xsl:value-of select="category"/></td>
            <td><xsl:value-of select="today/@current"/></td>
            <td><xsl:call-template name = "fivedayhistory"></td>
        </tr>

    </xsl:template>

    <xsl:template name="fivedayhistory">
        <table border="1">
            <tr>
                <th></th>
                <th>Open</th>
                <th>High</th>
                <th>Low</th>
                <th>Close</th>
                <th>Volume</th>
            </tr>

            <xsl:for-each select="portfolio/stock/five_day/day">
                <tr>
                    <td> <xsl:value-of select="day"> </td>
                </tr>
            </xsl:for-each>

            <tr>

            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>