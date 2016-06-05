![MFFoundationHeader](MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Maths/MFFastTrigo.h) - [Source File](../MFFoundation/Maths/MFFastTrigo.m)

------


## <font color='#1E72AD'>MFFastTrigo</font>

Blazing Speed Degrees Trigo Computation

-----

### Initialisation

#### buildMFFastTrigoTables   

Use buildMFFastTrigoTables before calling any MFFastTrigo function.
Calling this function allocates static tables with pre-computed trigo function return values.

<tt>**void buildMFFastTrigoTables();**</tt>

#### tearDownMFFastTrigo

Flush the memory allocated to store tables
 
<tt>**void tearDownMFFastTrigo();**</tt>

-----
        
### Calculation

#### mffsind

Returns the sinus of a given angle ( integer value, in degrees )

angle An integer angle between 0 and 359

Returns The sinus of the angle ( double value )

<tt>**double mffsind(long angle);**</tt>

#### mffcosd

Returns the cosinus of a given angle ( integer value, in degrees )

angle An integer angle between 0 and 359

Returns The cosinus of the angle ( double value )

<tt>**double mffcosd(long angle);**</tt>

#### mfftand

Returns the tangent of a given angle ( integer value, in degrees )

angle An integer angle between 0 and 359

Returns The tangent of the angle ( double value )

<tt>**double mfftand(long angle);**</tt>


#### mffpsind

 Returns the sinus, mapped to interval [0.0…1.0f], of a given angle ( integer value, in degrees )

 angle An integer angle between 0 and 359

Returns The sinus of the angle, mapped to [0.0f…1.0f] ( double value )

<tt>**double mffpsind(long angle);**</tt>

#### mffpcosd

 Return the cosinus, mapped to interval [0.0…1.0f], of a given angle ( integer value, in degrees )

 angle An integer angle between 0 and 359

Returns The cosinus of the angle, mapped to [0.0f…1.0f] ( double value )

<tt>**double mffpcosd(long angle);**</tt>

-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)