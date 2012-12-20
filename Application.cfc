<cfcomponent displayname="Application" output="false">

    <cfset application.langDetectionLoaded = false />

    <cffunction name="initApplication" access="private">
        <cfif application.langDetectionLoaded is false >
            <cfset application.detectorFactory = createObject("Java", "com.cybozu.labs.langdetect.DetectorFactory" ) />
            <cfset application.detectorFactory.loadProfile( expandPath("./profiles/") ) /><!--- caution: DetectorFactory uses a singleton, hand loadProfile will only be needed once! --->
        </cfif>
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