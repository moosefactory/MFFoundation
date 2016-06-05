![MFFoundationHeader](MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Extras/NSDate+MFExtras.h) - [Source File](../MFFoundation/Extras/NSDate+MFExtras.m)

------


## <font color='#1E72AD'>NSDate+MFExtras</font>

***

### -dateByClearingTime
<br>
Returns the target date with hours and minutes set to 0 (GMT)
<br><br>
<tt>**-(NSDate*)dateByClearingTime;**</tt>
<br><br>

-------


### -dateBySettingHour:minute:
<br>
Returns the target date with given hour ( modulo 24 ) and minute ( modulo 60 )
<br><br>
<tt>**-(NSDate*)dateBySettingHour:(NSUInteger)hour minute:(NSUInteger)minute;**</tt>
<br><br>

-------

### -isSameDayAsDate:

<br>
Returns true if target date is the same day than given date.<br>
<br>
<tt>**-(NSDate*)isSameDayAsDate:(NSDate*)date;**</tt>
<br><br>

-------

### -isSameMonthAsDate:

<br>
Returns true if target date is the same month than given date.<br>
<br>
<tt>**-(NSDate*)isSameMonthAsDate:(NSDate*)date;**</tt>
<br>

-------
oneMonthLater
oneMonthEarlier
oneDayLater
oneDayEarlier
secondsSinceStartOfDay
components

### -oneMonthLater

<br>
Returns the target date plus one month.<br>
<br>
<tt>**-(NSDate*)oneMonthLater;**</tt>
<br>

-------
### -oneMonthEarlier

<br>
Returns the target date minus one month.<br>
<br>
<tt>**-(NSDate*)oneMonthEarlier;**</tt>
<br>

-------
### -oneDayLater

<br>
Returns the target date plus one day.<br>
<br>
<tt>**-(NSDate*)oneDayLater;**</tt>
<br>

-------
### -oneDayEarlier

<br>
Returns the target date minus one day.<br>
<br>
<tt>**-(NSDate*)oneDayEarlier;**</tt>
<br>

-------
### -secondsSinceStartOfDay

<br>
Returns the number os seconds since the beginning of the day ( midnight of previous day ).<br>
<br>
<tt>**-(NSUInteger)secondsSinceStartOfDay;**</tt>
<br>

-------
### -components:

<br>
Returns the date components, based on the current system calendar.<br>
<br>
<tt>**-(NSDateComponents*)components;**</tt>
<br>
-------

-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)