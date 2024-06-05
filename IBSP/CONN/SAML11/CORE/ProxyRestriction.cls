/// ProxyRestriction condition
Class IBSP.CONN.SAML11.CORE.ProxyRestriction Extends IBSP.CONN.SAML11.CORE.Condition [ System = 4 ]
{

Property Audience As list Of %xsd.anyURI(XMLPROJECTION = "element", XMLREF = 1);

Property Count As %xsd.nonNegativeInteger(XMLPROJECTION = "attribute");

}
