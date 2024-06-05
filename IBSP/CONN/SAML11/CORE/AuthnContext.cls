/// Authentication Context
Class IBSP.CONN.SAML11.CORE.AuthnContext Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property AuthnContextClassRef As %xsd.anyURI(XMLREF = 1);

Property AuthnContextDecl As %XML.Adaptor(XMLCHOICELIST = "IBSP.CONN.SAML11.CORE.AuthnContextDecl,IBSP.CONN.SAML11.CORE.AuthnContextDeclRef", XMLPROJECTION = "element", XMLREF = 1, XMLTYPECONSTRAINT = "choice");

Property AuthenticatingAuthority As list Of %xsd.anyURI(XMLPROJECTION = "element", XMLREF = 1);

}
