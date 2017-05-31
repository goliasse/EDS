*-----------------------------------------------------------------------------
* <Rating>48</Rating>
*-----------------------------------------------------------------------------
PROGRAM CALLAT.LISTEN

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
	OFSSource = "GCS"
		
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
* Start T24
************************************************************************
	CALL JF.INITIALISE.CONNECTION ;* INITIALIZE T24 Session 
	
************************************************************************
* Loop Read Queue
************************************************************************	
AGAIN:
	REQUEST = JMSGET(QUEUEReceive) ;* Waiting/Retrieve a message
	
	CRT REQUEST
	CORRID = REQUEST<1>
	REQUEST = REQUEST<2>

	
	NBR.PARAM = DCOUNT(REQUEST, ',')
	NBR.PARAM=NBR.PARAM-1 

	
	DIM PARAM(NBR.PARAM)
	
	FOR I = 1 TO NBR.PARAM
	  IF I=1 THEN
	  	SUBROUTINENAME = FIELD(REQUEST,",",I)
	  END ELSE
	  	PARAM(I) = FIELD(REQUEST,",",I)
	  END

	NEXT I
	
	BEGIN CASE
	 CASE NBR.PARAM = 1
	 	CALL @SUBROUTINENAME (PARAM(1))
	 CASE NBR.PARAM = 2
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2))
	 CASE NBR.PARAM = 3
		 CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3))
	 CASE NBR.PARAM = 4
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4))
	 CASE NBR.PARAM = 5
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5))
	 CASE NBR.PARAM = 6
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(6))
	 CASE NBR.PARAM = 7
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(6),PARAM(7))
	 CASE NBR.PARAM = 8
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(2),PARAM(7),PARAM(8))
	 CASE NBR.PARAM = 9
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(2),PARAM(7),PARAM(8),PARAM(9))
	 CASE NBR.PARAM = 10
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(2),PARAM(7),PARAM(8),PARAM(9),PARAM(10))
	 CASE NBR.PARAM = 11
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(2),PARAM(7),PARAM(8),PARAM(9),PARAM(10),PARAM(11))
	 CASE NBR.PARAM = 12
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(2),PARAM(7),PARAM(8),PARAM(9),PARAM(10),PARAM(11),PARAM(12))
	 CASE NBR.PARAM = 13
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(2),PARAM(7),PARAM(8),PARAM(9),PARAM(10),PARAM(11),PARAM(12),PARAM(13))
	 CASE NBR.PARAM = 14
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(2),PARAM(7),PARAM(8),PARAM(9),PARAM(10),PARAM(11),PARAM(12),PARAM(13),PARAM(14))
	 CASE NBR.PARAM = 15
	 	CALL @SUBROUTINENAME (PARAM(1),PARAM(2),PARAM(3),PARAM(4),PARAM(5),PARAM(2),PARAM(7),PARAM(8),PARAM(9),PARAM(10),PARAM(11),PARAM(12),PARAM(13),PARAM(14),PARAM(15))
	END CASE
		

	
	RESPONSE = REQUEST
	
	SUCCESS = JMSPOST(QUEUEPost, RESPONSE, CORRID) ;* Send the response back.
GOTO AGAIN
	

END
