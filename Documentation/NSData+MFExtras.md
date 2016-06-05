![MacDown logo](./MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Extras/NSData+MFExtras.h) - [Source File](../MFFoundation/Extras/NSData+MFExtras.m)

------


## <font color='#1E72AD'>NSData+MFExtras</font>

***

### +dataWithBytesString:
<br>
Return data from data bytes formatted as a 'readable' string.<br>
*( Fast algorithm )*
<br><br>
<tt>**+(NSData*)dataWithBytesString:(NSString*)bytesString;**</tt>
<br><br>

-------


### -bytesString
<br>
Returns data bytes formatted as a 'readable' string.<br>
*( Fast algorithm )*
<br><br>
<tt>**-(NSString*)bytesString;**</tt>
<br><br>

-------

### +randomDataOfLength:

<br>
Returns random bytes.<br>
*( Fits for cryptographic usage )*
<br><br>
<tt>**+(NSArray*)randomDataOfLength:(NSUInteger)length;**</tt>
<br><br>
<font color='#FF3221'>Array must contains only NSString objects.</font>
<br><br>


-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)