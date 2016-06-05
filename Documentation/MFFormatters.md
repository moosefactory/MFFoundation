![MacDown logo](./MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Date%20and%20Formatters/MFFormatters.h) - [Source File](../MFFoundation/Date%20and%20Formatters/MFFormatters.m)

------


## <font color='#1E72AD'>MFFormatters</font>

***


### <font color='#1E72AD'>MFMoneyFormatter</font>

Superclass : **NSNumberFormatter**

##### +defaultMoneyFormatter

<tt>**+(MFMoneyFormatter*)defaultMoneyFormatter;**</tt>

##### +moneyFormatter

<tt>**+(MFMoneyFormatter*)moneyFormatter;**</tt>

##### +stringFromFloat:

<tt>**+(NSString*)stringFromFloat:(float)value;**</tt>

##### +stringFromNumber:

<tt>**+(NSString*)stringFromNumber:(NSNumber*)value;**</tt>

##### -stringFromFloat

<tt>**-(NSString*)stringFromFloat:(float)value;**</tt>

----

### <font color='#1E72AD'>MFDateFormatter</font>

Superclass : **NSDateFormatter**

##### +defaultDateFormatter

<tt>**+(MFDateFormatter*)defaultDateFormatter;**</tt>

##### +dateFormatter

<tt>**+(MFDateFormatter*)dateFormatter;**</tt>

##### +stringFromDate:

<tt>**+(NSString*)stringFromDate:(NSDate*)date;**</tt>

##### -stringFromDate:

<tt>**-(NSString*)stringFromDate:(NSDate*)date;**</tt>

----

### <font color='#1E72AD'>MFTimesFormatter</font>

Superclass : **NSFormatter**

##### +defaultTimesFormatter:

<tt>**+(MFTimesFormatter*)defaultTimesFormatter;**</tt>

##### +timesFormatter:

<tt>**+(MFTimesFormatter*)timesFormatter;**</tt>

##### +stringFromInteger:

<tt>**+(NSString*)stringFromInteger:(NSInteger)value;**</tt>

##### -stringFromInteger:

<tt>**-(NSString*)stringFromInteger:(NSInteger)value;**</tt>

##### -singular:

<tt>**@property(nonatomic,strong) NSString* singular;**</tt>

##### -plural:

<tt>**@property(nonatomic,strong) NSString* plural;**</tt>

##### -none:

<tt>**@property(nonatomic,strong) NSString* none;**</tt>

-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)