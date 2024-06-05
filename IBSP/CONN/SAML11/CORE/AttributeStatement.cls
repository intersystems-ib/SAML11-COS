/// Attribute Statement
Class IBSP.CONN.SAML11.CORE.AttributeStatement Extends IBSP.CONN.SAML11.CORE.Statement [ System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

/// PYD
Property Subject As IBSP.CONN.SAML11.CORE.Subject(XMLREF = 1);

/// PYD: Property Attribute As list Of %XML.Adaptor(CLASSNAME = 1, XMLCHOICELIST = "IBSP.CONN.SAML11.CORE.Attribute,IBSP.CONN.SAML11.CORE.EncryptedAttribute", XMLPROJECTION = "element", XMLREF = 1, XMLTYPECONSTRAINT = "choice") [ Required ];
Property Attribute As list Of IBSP.CONN.SAML11.CORE.Attribute(CLASSNAME = 1, XMLPROJECTION = "element", XMLREF = 1) [ Required ];

}
