![MacDown logo](./MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Date%20and%20Formatters/MFLatLongFormatter.h) - [Source File](../MFFoundation/Date%20and%20Formatters/MFLatLongFormatter.m)

------


## <font color='#1E72AD'>MFLatLongFormatter</font>

***

#### latLongFormatterFormat

- LatLongFormatter_CommaSeparated
- LatLongFormatter_DMS
- LatLongFormatter_ShowDegree
- LatLongFormatter_EW
- LatLongFormatter_Positive
- LatLongFormatter_Parameters



### -format

<tt>**@property(nonatomic,assign) latLongFormatterFormat format;**</tt>

-------

### -decimals

<tt>**@property(nonatomic,assign) NSUInt16 decimals;**</tt>

-------

### degreeToLatitude:

<tt>**+(NSString*)degreeToLatitude:(double)degFloat;**</tt>

-------

### degreeToLongitude:

<tt>**+(NSString*)degreeToLongitude:(double)degFloat;**</tt>

-------

### deg_to_dms:

<tt>**+(NSString*)deg_to_dms:(double)degfloat;**</tt>

-------


-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)