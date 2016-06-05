![MFFoundationHeader](MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Date%20and%20Formatters/MFDateUtils.h) - [Source File](../MFFoundation/Date%20and%20Formatters/MFDateUtils.m)

------


## <font color='#1E72AD'>MFDateUtils</font>

Superclass : **NSObject**

----
### Types and Constants

##### MFDaysSelectorMask

- MFDaysSelector_Monday  ( 0x01 )
- MFDaysSelector_Tuesday  ( 0x02 )
- MFDaysSelector_Wedenesday  ( 0x04 )
- MFDaysSelector_Thursday  ( 0x08 )
- MFDaysSelector_Friday  ( 0x10 )
- MFDaysSelector_Saturday  ( 0x20 )
- MFDaysSelector_Sunday  ( 0x40 )


##### MFDaysSelectorWorkingDays

<tt>**const extern MFDaysSelectorMask    MFDaysSelectorWorkingDays;**</tt>

<tt>**const extern MFDaysSelectorMask    MFDaysSelectorWeekEndDays;**</tt>

<tt>**const extern MFDaysSelectorMask    MFDaysSelectorEveryDay;**</tt>

<tt>**const extern MFDaysSelectorMask    MFDaysSelectorNoDays;**</tt>

----

### Methods

##### +rfc3339DateFormatter

Returns an rfc3339 date formatter.<br>

The rfc3339 is the format used by Unix, and is commonly used in url requests.

<tt>**+(NSDateFormatter*)rfc3339DateFormatter;**</tt>

##### +shortDateFormatter

<tt>**+(NSDateFormatter*)shortDateFormatter;

##### +dayStartDate

<tt>**+(NSDate*)dayStartDate;**</tt>

##### +weekStartDate

<tt>**+(NSDate*)weekStartDate;**</tt>

##### +previousWeekStartDate

<tt>**+(NSDate*)previousWeekStartDate;**</tt>

##### +yesterdayStartDate

<tt>**+(NSDate*)yesterdayStartDate;**</tt>

##### +beginOfMonthDateForDate:

<tt>**+(NSDate*)beginOfMonthDateForDate:(NSDate*)date;**</tt>

##### +endOfMonthDateForDate:

<tt>**+(NSDate*)endOfMonthDateForDate:(NSDate*)date;**</tt>


-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)