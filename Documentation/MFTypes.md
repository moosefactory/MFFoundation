![MacDown logo](./MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Types/MFTypes.h) - [Source File](../MFFoundation/Types/MFTypes.m)

------


## <font color='#1E72AD'>MFTypes</font>

Superclass : **NSObject**

----
### Types and Constants

##### MFCountryCode

	typedef struct {
	    char chars[2];
	} MFCountryCode;

##### MFLanguageCode

	typedef struct {
	    char chars[2];
	} MFLanguageCode;

##### MFLocaleCode

	typedef struct {
	    char chars[5];
	} MFLocaleCode;

##### MFLocation

	typedef struct {
  	  double longitude;
  	  double latitude;
  	  double altitude;
	} MFLocation;


-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)