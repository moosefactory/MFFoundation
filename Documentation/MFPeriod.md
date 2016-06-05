![MFFoundationHeader](MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Types/MFPeriod.h) - [Source File](../MFFoundation/Types/MFPeriod.m)

------


## <font color='#1E72AD'>MFPeriod</font>

Superclass : **NSObject**

<tt>**+(id)periodWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;**</tt>

<tt>**-(id)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;**</tt>

<tt>**+(id)periodWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute;**</tt>

<tt>**-(id)initWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute;**</tt>

<tt>**-(BOOL)containsDate:(NSDate*)date master:(BOOL*)master;**</tt>

<tt>**@property(nonatomic,strong) MFDateRange*    dateRange;**</tt>

<tt>**@property(nonatomic,assign) NSUInteger      periodicity;**</tt>

-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)