Class IBSP.CONN.SAML11.CORE.XML.Security.Signature Extends %XML.Security.Signature
{

/// Get node based on id from URI.  Return nodeId
Method GetNodeById(uri As %String, document As %XML.Document, node As %XML.Node) As %String [ Internal, Private ]
{
#define SAML11ns	"urn:oasis:names:tc:SAML:1.0:assertion"

	Set nodeId=document.GetNodeById(uri)
	// If reference to SAML assertion in enveloped-signature or SecurityToken\Reference,
	/// also check for SAML Assertion ID attribute
	If nodeId="" {
		Set node.NodeId=document.GetDocumentNode()  ; Envelope
		If node.MoveToFirstChild(1) && ; soap:Header
		   (node.LocalName="Header") && 
		   node.MoveToFirstChild(1) { ; first header
			Do {
				
				If (node.LocalName="Security") && 
				   (node.Namespace=$$$SOAPWSSEns) && 
				   node.MoveToFirstChild(1) {  ; First security element
				   //Write "LocalName=Security",!
					Do {
						If (node.LocalName="Assertion") && 
						   (node.Namespace=$$$SAML11ns) &&
						   (node.GetAttributeValue("AssertionID")=uri) {   ///PYD: changed "ID" to "AssertionID"
							Set nodeId=node.NodeId
						}
					} While node.MoveToNextSibling(1)
				} Else{
					//Write "ELSE Case. LocalName=",node.LocalName," Namespace=",node.Namespace,!
					//Write "AssertionID=",node.GetAttributeValue("AssertionID"),!
					If (node.LocalName="Assertion") && 
						 (node.Namespace=$$$SAML11ns) &&
						 (node.GetAttributeValue("AssertionID")=uri) {     ///PYD: changed "ID" to "AssertionID"
						 
						Set nodeId=node.NodeId	
					}
				}
			} While node.MoveToNextSibling(1)
		}
	}
	quit nodeId
}

}
