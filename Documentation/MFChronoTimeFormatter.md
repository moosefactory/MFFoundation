![MFFoundationHeader](MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Date%20and%20Formatters/MFChronoTimeFormatter.h) - [Source File](../MFFoundation/Date%20and%20Formatters/MFChronoTimeFormatter.m)

------


## <font color='#1E72AD'>MFChronoTimeFormatter</font>

***

A **NSFormatter** subclass that returns a given time ( in milliseconds ) formatted with chronometer style
<br><br>

### Properties


##### displayMinuteZeros

Displays minutes even if equal to 0 ( real chrono format )

_Example: (29 seconds)_

	true  : 00:29  
	false : 29
	
<tt>**@property(nonatomic,assign) BOOL displayMinuteZeros;**</tt>
<br><br>

-----

##### displayHours

Displays hours

_Example: (11 hours 7 minutes 31 seconds )_

	true  : 11:07:31  
	false : 07:31

<tt>**@property(nonatomic,assign) BOOL displayHours;**</tt>
<br><br>

-----

##### displaySeconds

Displays seconds

_Example: (3 hours 10 minutes 18 seconds)_

	false : 03:10  
	true  : 03:10:18  

<tt>**@property(nonatomic,assign) BOOL displaySeconds;**</tt>
<br><br>

-----

##### displayHoursZeros

Displays hours even if equal to 0.

_Example: (4 minutes 32 seconds )_

	false : 04:32 
	true  : 00:04:32 
	
<tt>**@property(nonatomic,assign) BOOL displayHoursZeros;**</tt>
<br><br>

-----

##### displayTenth

Displays tenth of seconds. ( if **displayHundredth** and **displayMilliseconds** are false. )

_Example: (10 minutes 42 seconds 735 milliseconds)_

	true : 10:42.7
	false: 10.42

<tt>**@property(nonatomic,assign) BOOL displayTenth;**</tt>
<br><br>

-----
##### displayHundredth

Displays hundredth of seconds. ( if **displayHundredth**  are false. )

_Example: (10 minutes 42 seconds 735 milliseconds)_

	true : 10:42.73
	false: 10.42


<tt>**@property(nonatomic,assign) BOOL displayHundredth;**</tt>

##### displayMilliseconds

Displays milliseconds.

_Example: (10 minutes 42 seconds 735 milliseconds)_

	true : 10:42.735
	false: 10.42


<tt>**@property(nonatomic,assign) BOOL displayMilliseconds;**</tt>
<br><br>


-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)