/// List of Conditions
Class IBSP.CONN.SAML11.CORE.Conditions Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

/// PYD: Not used.
/// Property Condition As list Of IBSP.CONN.SAML11.CORE.Condition(XMLPROJECTION = "element", XMLREF = 1, XMLTYPECONSTRAINT = "choice");
Property NotBefore As %xsd.dateTime(XMLPROJECTION = "attribute");

Property NotOnOrAfter As %xsd.dateTime(XMLPROJECTION = "attribute");

}
