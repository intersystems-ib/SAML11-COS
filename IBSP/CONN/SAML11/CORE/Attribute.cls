/// An Attribute
Class IBSP.CONN.SAML11.CORE.Attribute Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLNAME = "Attribute";

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

/// Property AttributeValue As list Of IBSP.CONN.SAML11.CORE.AttributeValue(XMLPROJECTION = "element", XMLREF = 1, XMLTYPECONSTRAINT = "choice");
Property AttributeValue As list Of IBSP.CONN.SAML11.CORE.AttributeValue(CLASSNAME = 1, REFELEMENTQUALIFIED = 0, REFNAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion", XMLPROJECTION = "element", XMLREF = 1);

Property AttributeName As %String(MAXLEN = "", XMLPROJECTION = "ATTRIBUTE");

Property AttributeNamespace As %String(MAXLEN = "", XMLPROJECTION = "ATTRIBUTE");

/*
Property Name As %String(MAXLEN = "", XMLPROJECTION = "attribute") [ Required ];
Property NameFormat As %xsd.anyURI(XMLPROJECTION = "attribute");
Property FriendlyName As %String(MAXLEN = "", XMLPROJECTION = "attribute") [ Required ];
*/
}
