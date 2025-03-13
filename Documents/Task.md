# Login (SSO)
1. SSO Understanding
   --> is a mechanism that allows users to access multiple websites and applications that only need to log in once.
2. How SSO works?
   There are components:
+ User
+ SP (Service Provider)
+ Idp (Identity Provider)
+ Authentication Token
****
Users --> SP --> Idp
+ User do not login --> username && password
+ User logged in --> OAuth2 access token --> SP processing --> valid token --> SP access
3. Common protocols of SSO (OAuth 2.0)
