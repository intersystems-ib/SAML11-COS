/// Authentication Content Declaration
Class IBSP.CONN.SAML11.CORE.AuthnContextDecl Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property Decl As %XML.String(MAXLEN = "", XMLPROJECTION = "content");

}
