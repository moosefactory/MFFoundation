![MacDown logo](./MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Extras/NSString+MFExtras.h) - [Source File](../MFFoundation/Extras/NSString+MFExtras.m)

------


## <font color='#1E72AD'>NSString+MFExtras</font>

***

### +UUIDString
<br>
Returns a Universally Unique Identifier (UUID)<br><br>
UUIDs (Universally Unique Identifiers), also known as GUIDs (Globally Unique Identifiers) or IIDs (Interface Identifiers), are 128-bit values designed to be unique.<br><br>
example : 68753A44-4D6F-1226-9C60-0050E4C00067.<br><br>
<tt>**+(NSString*)UUIDString;**</tt>
<br><br>

-------


### -md5
<br>
Returns the md5 hash of the target string
<br><br>
<tt>**-(NSString*)md5;**</tt>
<br><br>

-------

### -sha1

<br>
Returns the sha1 hash of the target string
<br>
<tt>**-(NSString*)sha1;**</tt>
<br><br>

-------

### -isValidEmail:

<br>
Returns YES if the target string is a valid eMail.<br>
<br>
<tt>**-(NSString*)isValidEmail:(BOOL)strict;**</tt>
<br>

-------

### -isValidName

<br>
Returns YES if the target string is a valid Name ( String composed only with letters run, non consecutive spaces and/or non consecutive hyphens ).<br><br>
_Examples:_<br>
John Doo<br>
Mary-Jo Foo<br>
Anny Boo-Ya<br>
<br>
<tt>**-(NSString*)isValidName;**</tt>
<br>

-------

### -urlEncode
<br>
Convenience method (PHP syntax).<br>
Returns an url encoded string.<br>

_Example:_<br>
Let's all shout "Moose & MooseFactory" !<br>

_Returns:_<br>
Let's%20all%20shout%20%22Moose%20&%20MooseFactory%22%20!

<br>
<tt>**-(NSString*)urlEncode;**</tt>
<br>

-------

### -urlDecode

<br>
Convenience method (PHP syntax).<br>
Returns a decoded url string.<br>

_Example:_<br>
Let's%20all%20shout%20%22Moose%20&%20MooseFactory%22%20!<br>

_Returns:_<br>
Let's all shout "Moose & MooseFactory" !<br>
<br>
<tt>**-(NSString*)urlDecode;**</tt>
<br>

-------

-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)