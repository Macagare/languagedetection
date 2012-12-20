<!--- 
This code is based on: http://code.google.com/p/language-detection/
--->

<cffunction name="hasNonLatinChars" returntype="boolean">
    <cfargument name="source" required="true" type="string" />
    <cfreturn false />
</cffunction>

<cfif structKeyExists( form, "formSend") and form.formSend eq "true">


    <cfset variables.source = form.txtContent />
    <cfoutput>source: #variables.source#<br/></cfoutput>
    <cfoutput>wrong char found: #hasNonLatinChars( variables.source )#</cfoutput>
    
    <cfif len(form.txtContent)>
        <cfset detector = application.detectorFactory.create() />
        <cfset detector.append( javaCast("string", form.txtContent) ) />
        <cfset langCode = detector.detect() />

        <p><cfoutput>found language: #langCode#</cfoutput></p>
    </cfif>
</cfif>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Filter for none-latin chars</title>
        <link rel="stylesheet" href="style.css" />
    </head>
    <body>
        <h1>Filter non latin charachters</h1>
        <form action="" method="POST" id="formInsert">
            <p><a href="http://generator.lorem-ipsum.info/" target="_blank">Lorm Generator</a></p>
            <textarea id="txtContent" name="txtContent" cols="50" rows="10"></textarea><br/>
            <input type="hidden" name="formSend" value="true" />
            <input type="submit" value="send">
        </form>
    </body>
</html>