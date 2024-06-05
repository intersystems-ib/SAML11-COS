/// Evidence for AuthzDecisionStatement
Class IBSP.CONN.SAML11.CORE.Evidence Extends (%RegisteredObject, %XML.Adaptor) [ Inheritance = right, System = 4 ]
{

Parameter XMLFORMAT = "literal";

Parameter NAMESPACE = "urn:oasis:names:tc:SAML:1.0:assertion";

Parameter ELEMENTQUALIFIED = 0;

Property Evidence As list Of IBSP.CONN.SAML11.CORE.AssertionReference(XMLPROJECTION = "element", XMLREF = 1, XMLTYPECONSTRAINT = "choice");

}
