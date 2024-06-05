/// Decision Action
Class IBSP.CONN.SAML11.CORE.Action Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property Action As %String(MAXLEN = "", XMLPROJECTION = "content") [ Required ];

Property Namespace As %xsd.anyURI(XMLPROJECTION = "attribute") [ Required ];

}
