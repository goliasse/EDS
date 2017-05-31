*-----------------------------------------------------------------------------
* <Rating>-4</Rating>
*-----------------------------------------------------------------------------
PROGRAM BROWSER.MDB.STOP

* This program provide a way to stop MDB

************************************************************************
* Queue Connection configuration
************************************************************************
	
	** jBoss 
	*
	ctxenv<-1> = "java.naming.factory.initial=org.jnp.interfaces.NamingContextFactory"
	ctxenv<-1> = "java.naming.factory.url.pkgs=org.jboss.naming"
	ctxenv<-1> = "java.naming.provider.url=localhost:1099"
	
	** jBoss 
	*
	CONTEXT = JMSGETCONTEXT(ctxenv) ;* Create a initial JMS Context*
	SUCCESS = CONTEXT<1>
	IF NOT(SUCCESS) THEN
		CRT "Error : " : CONTEXT<2>
		STOP
	END
	

		

	
************************************************************************
* Start TransactedMDB (JBOSS)
************************************************************************
	JMXOBJECTNAME="jboss.j2ee:ear=TAFJJEE_EAR.ear,jar=TAFJJEE_MDB.jar,name=TransactedMDB,service=EJB3"
	JMXMETHOD="stop"
	JMXMANAGEMDBSTATUS(CONTEXT,JMXOBJECTNAME,JMXMETHOD)	
	

END
