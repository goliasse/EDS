* @ValidationCode : Mjo1MDM3MzM1Mjk6SVNPLTg4NTktMToxNDg5NzUyMzY0NDk0OnNqdW5lam86LTE6LTE6MDowOmZhbHNlOk4vQTpERVZfMjAxNzAzLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 17 Mar 2017 12:06:04
* @ValidationInfo : Encoding          : ISO-8859-1
* @ValidationInfo : User Name         : sjunejo
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : DEV_201703.0
*-----------------------------------------------------------------------------
* <Rating>44</Rating>
*-----------------------------------------------------------------------------
PROGRAM COMPONENT.LISTEN

************************************************************************
* Queue JNDI Name configuration
************************************************************************
	
** jBoss 4.2.3 and jBoss 5 
*
*connectionFactory 	= "ConnectionFactory"
*requestQueue 		= "/queue/t24OFSQueue"
*replyQueue 		= "/queue/t24OFSReplyQueue"

** jBoss 6 eap, jBoss 7 community and wildfly
*
connectionFactory 	= "jms/RemoteConnectionFactory"

requestQueue 		= "jms/queue/t24OFSQueue"
replyQueue 			= "jms/queue/t24OFSReplyQueue"

** WebSphere / Weblogic
*
*connectionFactory   = "jms/ConnectionFactory"
*requestQueue 	     = "jms/t24OFSQueue"
*replyQueue 	     = "jms/t24OFSReplyQueue"


	

************************************************************************
* Queue Connection configuration
************************************************************************
	
** jBoss 4.2.3 and jBoss 5 
*
*ctxenv<-1> = "java.naming.factory.initial=org.jnp.interfaces.NamingContextFactory"
*ctxenv<-1> = "java.naming.factory.url.pkgs=org.jboss.naming"
*ctxenv<-1> = "java.naming.provider.url=localhost:1099"
	
	
** jBoss 6 eap, jBoss 7 community and wildfly
*
ctxenv<-1> = "java.naming.factory.initial=org.jboss.naming.remote.client.InitialContextFactory"
ctxenv<-1> = "java.naming.factory.url.pkgs=org.jboss.naming"
ctxenv<-1> = "java.naming.provider.url=remote://localhost:4447"

	
** Weblogic 
*
*ctxenv<-1> = "java.naming.factory.initial=weblogic.jndi.WLInitialContextFactory"	
*ctxenv<-1> = "java.naming.provider.url=t3://localhost:7001"
	
** jBoss / Weblogic
*
CONTEXT = JMSGETCONTEXT(ctxenv) ;* Create a initial JMS Context* 
SUCCESS = CONTEXT<1>
IF NOT(SUCCESS) THEN
	CRT "Error : " : CONTEXT<2>
	STOP
END 
	
	
** OpenMQ
*
*	ctxenv<-1> = "OpenMQ"
*	ctxenv<-1> = "localhost"
*	ctxenv<-1> = "7676"
*	ctxenv<-1> = "User"
*	ctxenv<-1> = "Password"
	
	
** MQSeries
*
*	ctxenv<-1> = "MQSeries"
*	ctxenv<-1> = "localhost"
*	ctxenv<-1> = "1414"
*	ctxenv<-1> = "QUEUE_MANAGER"
*	ctxenv<-1> = "T24Channel"
*	ctxenv<-1> = "User"
*	ctxenv<-1> = "Password"
	

** websphere
*
*	ctxenv<-1> = "websphere"
*	ctxenv<-1> = "localhost"
*	ctxenv<-1> = "7276"	
*	ctxenv<-1> = "T24Bus"
*	ctxenv<-1> = "User"
*	ctxenv<-1> = "Password"

** OpenMQ / MQSeries / Websphere
*
*	CONNECTION = JMSGETCONNECTION(ctxenv) ;* Create a initial JMS Context
*	SUCCESS = CONNECTION<1>
*	IF NOT(SUCCESS) THEN
*		CRT "Error : " : CONTEXT<2>
*		STOP
*	END 
	
************************************************************************
* JMS Session  
************************************************************************	
		
	SESSION = JMSGETSESSION(CONTEXT, connectionFactory)  ;* Create a JMS QueueSession giving a valid QueueConnectionFactory, passing the initial JMS Context
	
*	SESSION = JMSGETSESSION(CONTEXT, connectionFactory, "username", "password")  ;* Create a JMS QueueSession giving a valid QueueConnectionFactory, passing the initial JMS Context and valid user and password in case of secured connection

	
************************************************************************
* Queue Connection 
************************************************************************
	SUCCESS = SESSION<1>
	IF NOT(SUCCESS) THEN
		CRT "Error : " : SESSION<2>
		STOP
	END
	QUEUEPost = JMSGETQUEUE(SESSION, replyQueue, 1) ;* Create a Queue for post (last parameter is 1-Post or 0-Get

	SUCCESS = QUEUEPost<1>
	IF NOT(SUCCESS) THEN
		CRT "Error : " : QUEUEPost<2>
		STOP
	END
	QUEUEReceive = JMSGETQUEUE(SESSION, requestQueue, 0) ;* Create a Queue for get (last parameter is 1-Post or 0-Get

	SUCCESS = QUEUEReceive<1>
	IF NOT(SUCCESS) THEN
		CRT "Error : " : QUEUEReceive<2>
		STOP
	END
	
************************************************************************
* T24 OFS Source Configuration
************************************************************************
	OFSSource = "IRISPA"
		
	IF GETENV("OFS_SOURCE") = "" THEN
		IF PUTENV("OFS_SOURCE=":OFSSource) THEN
			CRT "OFS_SOURCE defaulted to '":OFSSource:"'"
		END
	END
	
************************************************************************
* Formatter configuration
************************************************************************
*	FormatterParam<-1> = "com.temenos.$$$$$$$$$.xml.SQXMLFormatter"
*	FormatteuParam<-1> = "INPUTT/123456"
*	FORMATTER = FORMATTERCREATE(FormatterParam) 
*	SUCCESS = FORMATTER<1>
*	IF NOT(SUCCESS) THEN
*		CRT "Error : " : FORMATTER<2>
*		STOP
*	END
	

************************************************************************
* Stop TransactedMDB (JBOSS)
************************************************************************
	JMXOBJECTNAME="jboss.j2ee:ear=TAFJJEE_EAR.ear,jar=TAFJJEE_MDB.jar,name=TransactedMDB,service=EJB3"
	JMXMETHOD="stop"
	JMXMANAGEMDBSTATUS(CONTEXT,JMXOBJECTNAME,JMXMETHOD)	
	
			
************************************************************************
* Loop Read Queue
************************************************************************	
AGAIN:
	REQUEST = JMSGET(QUEUEReceive) ;* Waiting/Retrieve a message
	
* Please do not change below order
	CRT REQUEST
	CORRID = REQUEST<1>
	
* Actual arguments recieved from Remote API along with its arguments details
	args = REQUEST<2>
	argTypes = REQUEST<3>
	
* API Detials to initialise and call
	apiInfo<1,1> = REQUEST<4, 1> ;* Actual API 
	apiInfo<1,2> = REQUEST<4, 2> ;* its Method
	apiInfo<1,3> = REQUEST<4, 3> ;* Runtime Properties like OFS Source etc Type information
	apiInfo<1,4> = REQUEST<4, 4> ;* UserContext Type information
	
* User Context
	userContext<1,1> = REQUEST<5, 1> ;* User context detail i.e. Company, User, Password, etc
	userContext<1,2> = REQUEST<5, 2> ;* Actual User context conceret type information
	
* Call the API
	RESPONSE = CALLEXTAPI(apiInfo, userContext, args, argTypes, OFSSource)
	
	SUCCESS = JMSPOST(QUEUEPost, RESPONSE, CORRID) ;* Send the response back.
GOTO AGAIN

END
