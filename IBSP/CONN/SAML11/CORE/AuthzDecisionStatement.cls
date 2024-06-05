/// Authorization Decision Statement
/// PYD Emporsis: Modificado de IBSP.CONN.SAML11.CORE.Statement as IBSP.CONN.SAML11.CORE.AttributeStatement
Class IBSP.CONN.SAML11.CORE.AuthzDecisionStatement Extends IBSP.CONN.SAML11.CORE.Statement [ System = 4 ]
{

/// PYD Emporsis
Parameter XMLNAME = "AuthorizationDecisionStatement";

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

/// PYD+
Property Subject As IBSP.CONN.SAML11.CORE.Subject(XMLREF = 1);

Property Action As list Of IBSP.CONN.SAML11.CORE.Action(XMLPROJECTION = "element", XMLREF = 1);

Property Evidence As IBSP.CONN.SAML11.CORE.Evidence(XMLREF = 1);

Property Decision As %String(VALUELIST = ",Permit,Deny,Indeterminate", XMLPROJECTION = "attribute") [ Required ];

Property Resource As %xsd.anyURI(XMLPROJECTION = "attribute") [ Required ];

}
