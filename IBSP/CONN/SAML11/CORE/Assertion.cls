Include (%soap, %xmlDOM)

/// 
/// SAML Assert Token for SOAP Security header.
/// PYDEMPORSIS: Added SuperClass SerialObject to include this as a Response Message
Class IBSP.CONN.SAML11.CORE.Assertion Extends (%RegisteredObject, , %SOAP.Security.Element, IBSP.CONN.SAML11.CORE.AssertionReference, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

/// PYD
Parameter XMLTYPE = "Assertion";

/// "Assertion11Base";
/// PYD
Parameter XMLNAME = "Assertion";

/// 11Base";
Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Parameter XMLPREFIX = "saml";

/// Need to distinguish the 2 different possible Signature elements.
Parameter XMLSEQUENCE = 1;

/// PYD:Property SAMLID As %String(MAXLEN = "", XMLNAME = "ID", XMLPROJECTION = "attribute") [ Required ];
Property SAMLID As %String(MAXLEN = "", XMLNAME = "AssertionID", XMLPROJECTION = "attribute") [ Required ];

Property IssueInstant As %xsd.dateTime(XMLPROJECTION = "attribute") [ Required ];

/// PYD: Property Issuer As IBSP.CONN.SAML11.CORE.NameID(XMLREF = 1) [ Required ];
Property Issuer As %String(XMLPROJECTION = "ATTRIBUTE") [ Required ];

/// PYD+
/// Property Version As %String(MAXLEN = "", XMLPROJECTION = "attribute") [ Required ];
Property MajorVersion As %String(XMLPROJECTION = "ATTRIBUTE") [ InitialExpression = "1" ];

/// PYD+
Property MinorVersion As %String(XMLPROJECTION = "ATTRIBUTE") [ InitialExpression = "1" ];

Property Conditions As IBSP.CONN.SAML11.CORE.Conditions(XMLREF = 1);

Property Statement As list Of IBSP.CONN.SAML11.CORE.Statement(CLASSNAME = 1, XMLPROJECTION = "element", XMLREF = 1, XMLTYPECONSTRAINT = "choice");

/// PYD: Subject is  in the StatementList
/// Property Subject As IBSP.CONN.SAML11.CORE.Subject(XMLREF = 1);
/// PYDSig:  Property Signature As %XML.Security.Signature(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.w3.org/2000/09/xmldsig#", XMLREF = 1);
Property Signature As IBSP.CONN.SAML11.CORE.XML.Security.Signature(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.w3.org/2000/09/xmldsig#", XMLREF = 1);

/// PYD: Property Advice As list Of IBSP.CONN.SAML11.CORE.AssertionReference(XMLREF = 1, XMLTYPECONSTRAINT = "choice");
/// PYDSig: Property WSSecuritySignature As %XML.Security.Signature(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.w3.org/2000/09/xmldsig#", XMLNAME = "Signature", XMLREF = 1) [ Internal ];
Property WSSecuritySignature As IBSP.CONN.SAML11.CORE.XML.Security.Signature(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.w3.org/2000/09/xmldsig#", XMLNAME = "Signature", XMLREF = 1) [ Internal ];

/// Save the node id of this element in the tree during import.
Property NodeId As %Integer(XMLPROJECTION = "none") [ Internal ];

/// If SubjectConfirmation is based on X509 certificate, this is the X509 certificate class.
/// This property is read-only.
Property X509Credentials As %SYS.X509Credentials(XMLPROJECTION = "none") [ Internal ];

Method X509CredentialsGet() As %SYS.X509Credentials [ Internal ]
{
	//PYD
	set error=""
	//Set error=..Validate(.tokenType,.credentials)
	
	If error'="" Quit ""
	
	Quit credentials
}

/// Get the X.509 credentials associated with this Security header element on input.
Method GetX509Credentials() As %SYS.X509Credentials [ CodeMode = expression ]
{
..X509Credentials
}

/// Save the node if when getting a new class instance.
ClassMethod XMLNew(document As %XML.Document, nodeId As %Integer, containerOref As %RegisteredObject = "") As %RegisteredObject
{
	Set oref=..%New()
	Set oref.NodeId=nodeId
	Quit oref
}

/// Create an unsigned SAML Asssertion
ClassMethod Create() As IBSP.CONN.SAML11.CORE.Assertion
{
	Set assertion=..%New()
	//PYDTEST: Set assertion.SAMLID=$system.Util.CreateGUID()
	Set assertion.SAMLID="_23f8a4ad91cd56ff7715912dd6ab072f"
	//pyd Set assertion.Version="2.0"
	Quit assertion
}

/// Create an SAML Asssertion with WS-Security Signature based on X.509 credentials.
ClassMethod CreateX509(credentials As %SYS.X509Credentials, referenceOption As %Integer) As IBSP.CONN.SAML11.CORE.Assertion
{
	#dim assertion As IBSP.CONN.SAML11.CORE.Assertion = ..Create()
	
	If $case($zobjclass(credentials),"%SYS.X509Credentials":0,"%SOAP.Security.BinarySecurityToken":0,:1) {
		Set assertion.WSSecuritySignature=""
		Set assertion.X509Credentials=""

	} Else {
		//PYDSig: #dim signature As %XML.Security.Signature 
		#dim signature As IBSP.CONN.SAML11.CORE.XML.Security.Signature 
		///PYD Set signature=##class(%XML.Security.Signature).CreateX509(.credentials,$$$SOAPWSIncludeNone,.referenceOption)
		Set signature=##class(IBSP.CONN.SAML11.CORE.XML.Security.Signature).CreateX509(.credentials,$$$SOAPWSIncludeNone,.referenceOption)
		Set assertion.WSSecuritySignature=signature
		Set assertion.X509Credentials=credentials
	}
	
	Quit assertion
}

/* PYD
/// Validate and get the credentials from the Assertion's SubjectConfirmationData element 
/// with holder-of-key method.
/// If valid, set credentials argument and return "". 
/// If not valid, return error code.
Method Validate(ByRef tokenType As %String, ByRef credentials As %SYS.X509Credentials) As %String [ Internal ]
{
	Set error=""
	Set (tokenType,credentials)=""
	
	#dim subject As SAML.SAML11.Subject = ..Subject
	If '$isobject(subject) Quit ""
	#dim subjectConfirmation As SAML.SAML11.SubjectConfirmation
	#dim subjectConfirmationData As SAML.SAML11.SubjectConfirmationData
	For i=1:1:subject.SubjectConfirmation.Count() {
		Set subjectConfirmation=subject.SubjectConfirmation.GetAt(i)
		If '$isobject(subjectConfirmation) Continue
		If subjectConfirmation.Method'=$$$SAMLHolderOfKey Continue

		Set subjectConfirmationData=subjectConfirmation.SubjectConfirmationData
		If '$isobject(subjectConfirmationData) Continue

		If $case($zobjclass(subjectConfirmationData),"SAML.SAML11.SubjectConfirmationData":0,"SAML.SAML11.KeyInfoConfirmationData":0,:1) Continue
		If '$isobject(subjectConfirmationData.KeyInfo) Continue
		If subjectConfirmationData.KeyInfo.Count()=0 Continue

		For j=1:1:subjectConfirmationData.KeyInfo.Count() {
			Set error=subjectConfirmationData.KeyInfo.GetAt(j).Validate(.tokenType)
			If error'="" Quit
			If tokenType="" {
				$$$SOAPLogSecurity("    Unsupported tokenType for SAML reference in KeyInfo")
				Set error="UnsupportedAlgorithm"
				Quit
			}
			Set credentials=subjectConfirmationData.KeyInfo.GetAt(j).X509Credentials
			If credentials'="" Quit
		}
		If (error'="") || (credentials'="") Quit
	}
	
	If error'="" Set ..X509Credentials=credentials

	Set tokenType=$$$SOAPWSSAML
	
	Quit error
}
*/
/// Initialize the signature in the SAML assertion.
Method InitializeForService(service As %SOAP.WebBase, header As %SOAP.Security.Header) As %Status [ Internal ]
{
	If ..SAMLID="" Set ..SAMLID=$system.Util.CreateGUID()
	
	Set sc=$$$OK
	If $isobject(..WSSecuritySignature) {
		Set ref=##class(%XML.Security.Reference).Create(..SAMLID,$$$SOAPWSEnvelopedSignature_","_$$$SOAPWSexcc14n)
		Do ..WSSecuritySignature.AddReference(ref)
		Set sc=..WSSecuritySignature.InitializeForService(service,header)
	}
	
	Quit sc
}

/// Complete the Signature element by adding the Reference elements to the 
/// SignedInfo based on the SignatureOptions and computing the signature value.
Method Perform(messageStream As %BinaryStream, header As %SOAP.Security.Header) As %Status [ Internal ]
{
	Set sc=$$$OK
	If $isobject(..WSSecuritySignature) {
		Set sc=..WSSecuritySignature.Perform(messageStream,header)
	}
	
	Quit sc
}

/// Reset the SAML assertion.
Method Reset() [ Internal ]
{
	If $isobject(..WSSecuritySignature) {
		Do ..WSSecuritySignature.Reset()
	}
}

/// Validate the SAML assertion.
/// If invalid return an error code.
Method ValidateElement(document As %XML.Document, service As %SOAP.WebBase) As %String [ Internal ]
{
	If ..SAMLID'="" $$$xmlSetNodeById(document.DocumentId,..SAMLID,..NodeId)
	
	If $isobject(..WSSecuritySignature) {
		$$$SOAPLogSecurity("    checking signature for SAML token")
		Set error=..WSSecuritySignature.ValidateElement(document,service)
		$$$SOAPLogSecurity("    signature validation for SAML token returned: "_error)
		If error'="" Quit error
	}
	
	If '$isobject(..Issuer) || (..Issuer.NameID="") {
		$$$SOAPLogSecurity("    unspecified Issuer for SAML token")
		Quit "InvalidSecurityToken"
	}
	
	Quit ""
}

}
