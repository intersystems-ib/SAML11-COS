# SAML11-COS

SAML1.1 Token for Catalan HealthCare Authorities from InterSystems IRIS ObjectScript.

# What is included?

It includes just the standard IRIS classes related to SAML modified to allow SAML 1.1. 

# What is not included?

It does not include any kind of usage by itself. Each integration which needs SAML 1.1 must use these classes in their specific way but it is not included in this repository.

# Requirements

There are no dependencies with other libraries or special packages. It has been tested only in **InterSystems IRIS 2022.1.3+**.

# How to install them?

You just need import all the classes using the file **install/IBSP.CONN.SAML11.xml**. 

1. Open IRIS Management Portal
2. Go to System Explorer > Classes
3. Select your namespace
4. Click on Import button
5. Browse either in your local machine or in the remote server the file **IBSP.CONN.SAML11.xml**
6. Click on Next
7. You should see all the classes included in the component. Click on Import.
8. All the classes should be imported and compiled successfully. There are no dependencies with other modules, just with IRIS.
