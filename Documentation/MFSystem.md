![MacDown logo](./MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/System/MFSystem.h) - [Source File](../MFFoundation/System/MFSystem.m)

------


## <font color='#1E72AD'>MFSystem</font>

Superclass : **NSObject**

#### +machine

<tt>**+(NSString*)machine;**</tt>

#### +model

<tt>**+(NSString*)model;**</tt>

#### +cpu

<tt>**+(NSString*)cpu;**</tt>

#### +byteorder

<tt>**+(NSInteger)byteorder;**</tt>

#### +architecture

<tt>**+(NSString*)architecture;**</tt>


#### +kernelVersion

<tt>**+(NSString*)kernelVersion;**</tt>

#### +kernelRelease

<tt>**+(NSString*)kernelRelease;**</tt>

#### +kernelRevision

<tt>**+(NSString*)kernelRevision;**</tt>


#### +systemVersion

<tt>**+(NSString*)systemVersion;**</tt>

#### +systemVersionPatch

<tt>**+(NSString*)systemVersionPatch;**</tt>


#### +systemVersionFloat

<tt>**+(float)systemVersionFloat;**</tt>


#### +systemVersionPriorTo:

<tt>**++(BOOL)systemVersionPriorTo:(NSString*)systemVersion;**</tt>


#### +systemVersionPriorOrEqualTo:

<tt>**+(BOOL)systemVersionPriorOrEqualTo:(NSString*)systemVersion;**</tt>


#### +systemVersionEqualTo:

<tt>**++(BOOL)systemVersionEqualTo:(NSString*)systemVersion;**</tt>

-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)