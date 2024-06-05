Include %soap

/// A SAML Subject
Class IBSP.CONN.SAML11.CORE.Subject Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

/// PYD: Changed
Property NameIdentifier As IBSP.CONN.SAML11.CORE.NameIdentifier(XMLREF = 1);

/*
Property NameID As SAML.SAML11.BaseID(XMLREF = 1, XMLTYPECONSTRAINT = "choice");

Property SubjectConfirmation As list Of SAML.SAML11.SubjectConfirmation(XMLPROJECTION = "element", XMLREF = 1);
*/

/*
/// Create SubjectConfirmation with specified SubjectConfirmation method.
/// The method argument should be $$$SAMLSenderVouches, $$$SAMLHolderOfKey or $$$SAMLBearer.
/// The NameID field must still be set for the Subject.
Method AddConfirmation(method As %String) As %Status
{
	#dim subjectConfirmation As SAML.SAML11.SubjectConfirmation = ##class(SAML.SAML11.SubjectConfirmation).%New()
	Set subjectConfirmation.Method=method
	Do ..SubjectConfirmation.Insert(subjectConfirmation)
	
	Quit $$$OK
}

/// Create SubjectConfirmation and associated KeyInfo for holder-of-key SubjectConfirmation based X.509 credentials.
/// The NameID field must still be set for the Subject.
Method AddX509Confirmation(credentials As %SYS.X509Credentials, referenceOption As %Integer) As %Status
{
	If referenceOption=$$$SOAPWSReferenceDirect {
		Set sc=$$$ERROR($$$SOAPBadLogin,"BinarySecurityToken not supported for SubjectConfirmation")
		$$$SOAPLogSecurity("    BinarySecurityToken not supported for SubjectConfirmation")
		Quit sc
	}
	
	#dim subjectConfirmation As SAML.SAML11.SubjectConfirmation = ##class(SAML.SAML11.SubjectConfirmation).%New()
	#dim subjectConfirmationData As SAML.SAML11.SubjectConfirmationData = ##class(SAML.SAML11.SubjectConfirmationData).%New()
	#dim keyinfo As %XML.Security.KeyInfo = ##class(%XML.Security.KeyInfo).CreateX509(.credentials,.referenceOption)
	If keyinfo="" {
		Set sc=$$$ERROR($$$SOAPBadLogin,"Unable to create KeyInfo for SubjectConfirmation")
		$$$SOAPLogSecurity("    Unable to create KeyInfo for SubjectConfirmation")
		Quit sc
	}

	Do ..SubjectConfirmation.Insert(subjectConfirmation)
	Set subjectConfirmation.SubjectConfirmationData=subjectConfirmationData
	Set subjectConfirmation.Method=$$$SAMLHolderOfKey
	Do subjectConfirmationData.KeyInfo.Insert(keyinfo)
	
	Quit $$$OK
}
*/
}
