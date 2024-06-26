/// Base class for an encrypted assertion, attribute or id.
Class IBSP.CONN.SAML11.CORE.EncryptedElement Extends (%RegisteredObject, %XML.Adaptor) [ Abstract, Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property EncryptedData As %XML.Security.EncryptedData(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.w3.org/2001/04/xmlenc#", XMLREF = 1) [ Required ];

Property EncryptedKey As list Of %XML.Security.EncryptedKey(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.w3.org/2001/04/xmlenc#", XMLPROJECTION = "element", XMLREF = 1);

}
