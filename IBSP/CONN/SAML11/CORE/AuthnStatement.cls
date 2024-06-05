/// Authentication Statement
Class IBSP.CONN.SAML11.CORE.AuthnStatement Extends IBSP.CONN.SAML11.CORE.Statement [ System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property SubjectLocality As IBSP.CONN.SAML11.CORE.SubjectLocality(XMLREF = 1);

Property AuthnContext As IBSP.CONN.SAML11.CORE.AuthnContext(XMLREF = 1) [ Required ];

Property AuthnInstant As %xsd.dateTime(XMLPROJECTION = "attribute") [ Required ];

Property SessionIndex As %String(MAXLEN = "", XMLPROJECTION = "attribute");

Property SessionNotOnOrAfter As %xsd.dateTime(XMLPROJECTION = "attribute");

}
