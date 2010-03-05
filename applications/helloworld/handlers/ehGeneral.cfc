<!-----------------------------------------------------------------------Author 	 :	Luis MajanoDate     :	September 25, 2005Description : 				General handler for my hello application. 		Modification History:Sep/25/2005 - Luis Majano	-Created the template.-----------------------------------------------------------------------><cfcomponent name="ehGeneral" extends="coldbox.system.EventHandler" output="false">	<!--- ************************************************************* --->	<cffunction name="dspHello" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<!--- EXIT HANDLERS: --->		<cfset Event.setValue("xehHello", "ehGeneral.doHello")>		<cfset Event.setValue("xehStartOver", "ehGeneral.doStartOver")>		<!--- Do Your Logic Here --->		<cfset getPlugin("Logger").tracer("Starting dspHello. Using default name")>		<cfset Event.setValue("firstname",getSetting("Codename", true) & getSetting("Version", true) )>		<!--- Set the View To Display, after Logic --->		<cfset Event.setView("vwHello")>		<cfset getPlugin("Logger").tracer("View has been set")>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="doHello" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<!--- EXIT HANDLERS: --->		<cfset Event.setValue("xehHello", "ehGeneral.doHello")>		<cfset Event.setValue("xehStartOver", "ehGeneral.doStartOver")>		<!--- Logger --->		<cfset getPlugin("Logger").tracer(Event.getValue("firstname"))>		<!--- Do Your Logic Here --->		<cfif Event.getValue("firstname") eq "">			<cfset Event.setValue("firstname","Not Found")>		</cfif>		<!--- Set the View To Display, after Logic --->		<cfset Event.setView("vwHelloRich")>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="doStartOver" access="public" returntype="void" output="false"> 		<cfargument name="Event" type="any">		<!--- Do Your Logic Here --->		<cfset setNextEvent("ehGeneral.dspHello")>	</cffunction>	<!--- ************************************************************* --->	<!--- ************************************************************* --->	<cffunction name="dspPopup" access="public" returntype="void" output="false">		<cfargument name="Event" type="any">		<!--- Render a view with no layout. --->		<cfset Event.setView("vwTest",true)>	</cffunction>	<!--- ************************************************************* --->	</cfcomponent>