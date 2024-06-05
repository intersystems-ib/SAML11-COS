Class IBSP.CONN.SAML11.CORE.NameIdentifier Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, ProcedureBlock, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property Format As %String(MAXLEN = "", XMLPROJECTION = "ATTRIBUTE");

/// Set any string value as the attribute.	
Property value As %XML.String(MAXLEN = "", XMLPROJECTION = "content");

/// Set any string value as the attribute.	
Property NameQualifier As %XML.String(MAXLEN = "", XMLPROJECTION = "ATTRIBUTE");

}
