![MacDown logo](./MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Types/MFDateRange.h) - [Source File](../MFFoundation/Types/MFDateRange.m)

------


## <font color='#1E72AD'>MFDateRange</font>

Superclass : **NSObject**

<tt>**+(id)dateRangeWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;**</tt>

<tt>**-(id)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;**</tt>

<tt>**+(id)dateRangeWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute;**</tt>

<tt>**-(id)initWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute;**</tt>

<tt>**-(BOOL)containsDayWithComponents:(NSDateComponents*)comps inCalendar:(NSCalendar*)cal;**</tt>

<tt>**-(BOOL)containsDate:(NSDate*)date;**</tt>

<tt>**-(void)startHour:(NSUInteger*)hours minutes:(NSUInteger*)minutes;**</tt>

<tt>**-(void)endHour:(NSUInteger*)hours minutes:(NSUInteger*)minutes;**</tt>

<tt>**-(NSTimeInterval)duration;**</tt>

<tt>**@property(nonatomic,strong) NSDate* startDate;**</tt>

<tt>**@property(nonatomic,strong) NSDate* endDate;**</tt>

-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)