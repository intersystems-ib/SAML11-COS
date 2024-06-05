/// Subject Locality
Class IBSP.CONN.SAML11.CORE.SubjectLocality Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property Address As %String(MAXLEN = "", XMLPROJECTION = "attribute");

Property DNSName As %String(MAXLEN = "", XMLPROJECTION = "attribute");

}
