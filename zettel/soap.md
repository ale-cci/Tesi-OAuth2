# SOAP (Single Object Access protocol)

Allows developers to invoke process running on disparate operating system,
authenticate, authorize and communicate using XML. Since Web protocols like HTTP
are installed and running on all operating systems, SOAP allows clients to
invoke web services and receive responses independent of language and platforms.

### Why SOAP
Best way to communicate between application is over HTTP, because HTTP is
supported by all internet browsers and servers. SOAP was created to accomplish
this.


## SOAP Building Blocks
From [w3schools](https://www.w3schools.com/xml/xml_soap.asp#:~:text=A%20SOAP%20message%20is%20an,containing%20errors%20and%20status%20information):
```
A SOAP message is an ordinary XML document containing the following elements:
  *  An Envelope element that identifies the XML document as a SOAP message
  *  A Header element that contains header information
  *  A Body element that contains call and response information
  *  A Fault element containing errors and status information
```
