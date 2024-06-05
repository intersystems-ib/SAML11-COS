/// Data for SubjectConfirmation wit hKeyInfo
Class IBSP.CONN.SAML11.CORE.KeyInfoConfirmationData Extends IBSP.CONN.SAML11.CORE.SubjectConfirmationData [ System = 4 ]
{

Property KeyInfo As list Of %XML.Security.KeyInfo(REFELEMENTQUALIFIED = 1, REFNAMESPACE = "http://www.w3.org/2000/09/xmldsig#", XMLPROJECTION = "element", XMLREF = 1);

///  Override the content field and make it invisible.
Property content As %XML.String(MAXLEN = "", XMLPROJECTION = "none") [ Internal ];

}
