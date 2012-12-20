<cfcomponent displayname="Application" output="false">

    <cfset application.langDetectionLoaded = false />

    <cffunction name="initApplication" access="private">
        <cfset application.detectorFactory = createObject("Java", "com.cybozu.labs.langdetect.DetectorFactory" ) />
        <cftry>
            <cfset application.detectorFactory.loadProfile( expandPath("./profiles/") ) /><!--- caution: DetectorFactory uses a singleton, hand loadProfile will only be needed once! --->
            <cfcatch type="any"></cfcatch>
        </cftry>
    </cffunction>

    <cffunction name="onApplicationStart">
        <cfset initApplication() />
    </cffunction>

    <cffunction name="onRequestStart">
        <cfscript>
            if (structKeyExists(url, 'reinit')){
                initApplication();
            }
        </cfscript>
    </cffunction>
    
</cfcomponent>