# Security Assertion Markup Language
open standard for exchanging authentication and authorization data between parties:
identity provider and service provider. XML based.


### Overview
Three roles:
1. Human user
2. Identity Provider (IdP)
3. Service Provider (SP)

principal requests a service from the service provider.
SP requests and obtains authentication assertion from IDP.
SP can make an access control decision.

subject usually (but not necessarily) is a human.

subject which something is being asserted. == principal.

the service provider can make access control decision, where it can decide whether to perform the service for the connected principal.

before delivering subject-based assertion to the SP, the IDP may require infromation (i.e. username and password).
one IDP may provide SAML assertions to many service providers. similarly one SP may rely
on and trust assertions from many independent IDPS.

SAML does not specify the method of authentication of the idp.

### Design
SAML built in upon a number of existing standards:
* XML: Assertions are exchanged in ML, from which the name SAML
* [XML Schema](./xml_schema.md)
* XML Signature: digital signature for authentication and message integrity
* HTTP:

* [SOAP](./soap.md)

#### Assertions:
SAML assertion contains a packet of security information:
```
<saml:Assertion ...>
  ...
</saml:Assertion>
```

`Assertion A was issued at time t by issuer R regarding subject S provided conditions C are valid`.
SAML assertions are transferred from Identity to Service provider. Assertions
contain statements that service providers use to make access-control decisions.
3 Types of statements are provided:

  1. **Authentication statements**: assert to the sp that the principal did
     authenticate with the identity provider at a particular time.

  2. **Attribute statements**: asserts that a principal is associated with certain
     attributes. An attribute is a name-value pair.

  3. **Authorization decision statements**: Assert that a principal is permitted to
     perform action A on resource R, given evidence E.

### Protocols:
SAML protocols describes how certain SAML elements (including assertions) are
packaged with SAML request and response elements. for the most part a saml
protocol is a simple request - response protocol.

most important saml protocol is called "query". A service provider makes a query
directly to an identity provider over a secure back channel. Query messages are
typically bound to soap. 3 saml querys:
  1. Authentication querys
  2. Attribute querys
  3. Authorization querys
The result of an attribute query is a saml resopnse an assertions which itself
contains an attribute statement.

### Bindings

### Profiles

### Security
SAML specifications recommends:
* TLS 1.0+ for transport-level security
* XML Signature and XML Encryption for message-level security

![SAML uml action diagram](https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Saml2-browser-sso-redirect-post.png/600px-Saml2-browser-sso-redirect-post.png)



### Links:
[Wikipedia]: https://en.wikipedia.org/wiki/Security_Assertion_Markup_Language#Overview
[SAML]: <no-file>
[Protocol]: <no-file>
[Authentication]: <no-file>
[SSO]: <no-file>
[Comparison with Oauth2]: https://www.ubisecure.com/uncategorized/difference-between-saml-and-oauth/#:~:text=SAML%20(Security%20Assertion%20Mark%2Dup,doesn't%20deal%20with%20authentication.
