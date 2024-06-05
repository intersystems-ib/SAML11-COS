/// A SAML SubjectConfirmation
Class IBSP.CONN.SAML11.CORE.SubjectConfirmation Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property NameID As IBSP.CONN.SAML11.CORE.BaseID(XMLREF = 1, XMLTYPECONSTRAINT = "choice");

Property SubjectConfirmationData As IBSP.CONN.SAML11.CORE.SubjectConfirmationData(XMLREF = 1);

Property Method As %xsd.anyURI(XMLPROJECTION = "attribute") [ Required ];

}
