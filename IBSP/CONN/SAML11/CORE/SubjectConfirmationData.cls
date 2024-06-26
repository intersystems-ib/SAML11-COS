/// Data for SubjectConfirmation
Class IBSP.CONN.SAML11.CORE.SubjectConfirmationData Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

/// Normal case allow any XML content.
Property content As %XML.String(MAXLEN = "", XMLPROJECTION = "content");

/// As a special case allow a list of KeyInfo elements as need for WS-Security.
Property KeyInfo As list Of %XML.Security.KeyInfo(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.w3.org/2000/09/xmldsig#", XMLPROJECTION = "element", XMLREF = 1);

Property NotBefore As %xsd.dateTime(XMLPROJECTION = "attribute");

Property NotOnOrAfter As %xsd.dateTime(XMLPROJECTION = "attribute");

Property Recipient As %xsd.anyURI(XMLPROJECTION = "attribute");

Property InResponseTo As %String(MAXLEN = "", XMLPROJECTION = "attribute");

Property Address As %String(MAXLEN = "", XMLPROJECTION = "attribute");

}
