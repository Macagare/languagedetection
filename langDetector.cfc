<cfcomponent displayname="LanguageDetection">
    <cffunction name="init" returntype="any" >
        <cfreturn this />
    </cffunction>

    <cffunction name="getTextLangCode" access="remote" returntype="string" hint="Get language code for passed text.">
        <cfargument name="text" type="string" required="true" >

        <cfif len(arguments.text)>
            <cfset detector = application.detectorFactory.create() />
            <cfset detector.append( javaCast("string", arguments.text) ) />
            <cfset langCode = detector.detect() />

            <cfreturn langCode />
        </cfif>

        <cfreturn "no text passed" />
    </cffunction>
</cfcomponent>