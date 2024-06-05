/// AudienceRestriction condition
Class IBSP.CONN.SAML11.CORE.AudienceRestriction Extends IBSP.CONN.SAML11.CORE.Condition [ System = 4 ]
{

Property Audience As list Of %xsd.anyURI(XMLPROJECTION = "element", XMLREF = 1) [ Required ];

}
