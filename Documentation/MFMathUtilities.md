![MFFoundationHeader](MFFoundation_Header.png)

**Utility library ( static ) based on NSFoundation**<br>
*Fits for any apple system : iOS, MacOS, WatchOS, tvOS*

------
[Back to Home](../README.md) - [Header File](../MFFoundation/Maths/MFMathUtilities.h) - [Source File](../MFFoundation/Maths/MFMathUtilities.m)

------


## <font color='#1E72AD'>MFMathUtilities</font>

A collection of extra math functions.

-----

### Types and Constants


##### MF_PiOnThree

Pre-Computed value of Pi/3

<tt>**#define MF_PiOnThree    1.047197551196597631317786181171**</tt>

##### MF_PiOnThree

Pre-Computed value of Pi/3

<tt>**#define MF_TwoPiOnThree  2.094395102393195262635572362342**</tt>

-----

### Clamp


#### MF_clampOne

Clamp a double value to the interval [0.0…1.0]

<tt>**double MF_clampOne(double value);**</tt>

#### MF_clampOnef

Clamp a float value to the interval [0.0…1.0]
@return Clamped float value
 @param value a float value
 @indexgroup Clamping

<tt>**float MF_clampOnef(float value);**</tt>


#### MF_clampOnel

Clamp a long double value to the interval [0.0…1.0]
@return Clamped long double value
 @param value a long double value
 @indexgroup Clamping

<tt>**long double MF_clampOnel(long double value);**</tt>


-----

### Modulo


#### MF_mod

Return the modulo of two double values

For example, MF_mod(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )

@return double modulo value
 @indexgroup Modulo

<tt>**double MF_mod(double x,double d);**</tt>


#### MF_modf

Return the modulo of two float values

For example, MF_modf(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )

@return float modulo value
 @indexgroup Modulo

<tt>**float MF_modf(float x,float d);**</tt>


#### MF_modl

Return the modulo of two long double values

For example, MF_modl(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )

@return long double modulo value
 @indexgroup Modulo

<tt>**long double MF_modl(long double x,long double d);**</tt>



-----

### Trigo
    
#### MF_clampAngle

Clamps any given double angle to a [0-2Pi] interval

For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )

@return double Angle [ 0 - 2Pi ]
 @indexgroup Trigo
 
<tt>**double MF_clampAngle(double angle);**</tt>



#### MF_clampAnglef

Clamps any given float angle to a [0-2Pi] interval

For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )

@return float Angle [ 0 - 2Pi ]
 @indexgroup Trigo
 
<tt>**float MF_clampAnglef(float angle);**</tt>


#### MF_clampAnglel

Clamps any given long double angle to a [0-2Pi] interval

For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )

@return long double Angle [ 0 - 2Pi ]
 @indexgroup Trigo
 
<tt>**long double MF_clampAnglel(long double angle);**</tt>



#### MF_psin

Computes a 'positive sinus'

This function computes ( sin(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psin(0) = 0.5f

@return double value
 @indexgroup Trigo
 
<tt>**double MF_psin(double angle);**</tt>


#### MF_psinf

Computes a 'positive sinus'

This function computes ( sin(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psinf(0) = 0.5f

@return float value
  @indexgroup Trigo

<tt>**float MF_psinf(float angle);**</tt>


#### MF_psinl

Computes a 'positive sinus'

This function computes ( sin(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psinl(0) = 0.5f

@return long double value
  @indexgroup Trigo

<tt>**long double MF_psinl(long double angle);**</tt>


#### MF_pcos

Computes a 'positive cosinus'

This function computes ( cos(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcos(Pi/2) = 0.5f

@return double value
  @indexgroup Trigo

<tt>**double MF_pcos(double angle);**</tt>


#### MF_pcosf

Computes a 'positive cosinus'

This function computes ( cos(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcosf(Pi/2) = 0.5f

@return float value
  @indexgroup Trigo

<tt>**float MF_pcosf(float angle);**</tt>


#### MF_pcosl

Computes a 'positive cosinus'

This function computes ( cos(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcosl(Pi/2) = 0.5f

@return long double value
  @indexgroup Trigo

<tt>**long double MF_pcosl(long double angle);**</tt>


#### MF_cartesianToPolar
    
Convert a cartesian coordinates to polar coordinates
     @return Polar coordinate ( teta, phi ) in double values
     @param x The x value of the coordinate to convert
     @param y the y value of the coordinate to convert
     @indexgroup Trigo

<tt>**void MF_cartesianToPolar(double x,double y, double* teta,double *phi);**</tt>

#### MF_cartesianToPolarf
    
Convert a cartesian coordinates to polar coordinates
     @return Polar coordinate ( teta, phi ) in float values
     @param x The x value of the coordinate to convert
     @param y the y value of the coordinate to convert
     @indexgroup Trigo

<tt>**void MF_cartesianToPolarf(float x,float y, float* teta,float *phi);**</tt>

#### MF_cartesianToPolarl
    
Convert a cartesian coordinates to polar coordinates
     @return Polar coordinate ( teta, phi ) in long double values
     @param x The x value of the coordinate to convert
     @param y the y value of the coordinate to convert
     @indexgroup Trigo

<tt>**void MF_cartesianToPolarl(long double x,long double y, long double* teta,long double *phi);**</tt>

    
#### MF_polarToCartesian
    
Convert a polar coordinates to cartesian coordinates
     @return Cartesian coordinate ( x, y ) in double values
     @param teta The teta value ( angle ) of the coordinate to convert
     @param phi the phi value ( vector length ) of the coordinate to convert
     @indexgroup Trigo

<tt>**void MF_polarToCartesian(double teta,double phi,double *x, double *y);**</tt>

#### MF_polarToCartesianf
    
Convert a polar coordinates to cartesian coordinates
     @return Cartesian coordinate ( x, y ) in float values
     @param teta The teta value ( angle ) of the coordinate to convert
     @param phi the phi value ( vector length ) of the coordinate to convert
     @indexgroup Trigo

<tt>**   void MF_polarToCartesianf(float teta,float phi,float *x, float *y);**</tt>

#### MF_polarToCartesianl
    
Convert a polar coordinates to cartesian coordinates
     @return Cartesian coordinate ( x, y ) in long double values
     @param teta The teta value ( angle ) of the coordinate to convert
     @param phi the phi value ( vector length ) of the coordinate to convert
     @indexgroup Trigo

<tt>**void MF_polarToCartesianl(long double teta,long double phi,long double *x, long double *y);**</tt>

-----

### Comparison
    
#### MF_max
    
Compares two given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a double value
     @param f2 a double value

<tt>**double MF_max(double f1, double f2);**</tt>

#### MF_maxf
    
Compares two given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a float value
     @param f2 a float value

<tt>**float MF_maxf(float f1, float f2);**</tt>

#### MF_maxl
    
Compares two given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a long double value
     @param f2 a long double value

<tt>**long double MF_maxl(long double f1, long double f2);**</tt>


#### MF_min
    
Compares two given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a double value
     @param f2 a double value

<tt>**double MF_min(double f1, double f2);**</tt>

#### MF_minf
    
Compares two given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a float value
     @param f2 a float value

<tt>**float MF_minf(float f1, float f2);**</tt>

#### MF_minl
    
Compares two given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a long double value
     @param f2 a long double value

<tt>**long double MF_minl(long double f1, long double f2);**</tt>


#### MF_max3
    
Compares three given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a double value
     @param f2 a double value
     @param f3 a double value

<tt>**double MF_max3(double f1, double f2, double f3);**</tt>

#### MF_max3f
    
Compares three given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a float value
     @param f2 a float value
     @param f3 a float value

<tt>**float MF_max3f(float f1, float f2, float f3);**</tt>

#### MF_max3l
    
Compares three given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a long double value
     @param f2 a long double value
     @param f3 a long double value

<tt>**long double MF_max3l(long double f1, long double f2, long double f3);**</tt>


#### MF_min3
    
Compares three given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a double value
     @param f2 a double value
     @param f3 a double value

<tt>**double MF_min3(double f1, double f2, double f3);**</tt>

#### MF_min3f
    
Compares three given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a float value
     @param f2 a float value
     @param f3 a float value

<tt>**float MF_min3f(float f1, float f2, float f3);**</tt>

#### MF_min3l
    
Compares three given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a long double value
     @param f2 a long double value
     @param f3 a long double value

<tt>**long double MF_min3l(long double f1, long double f2, long double f3);**</tt>


-------
MFFoundationFramework - ©2007-2016 Tristan Leblanc - MooseFactory Software<br><br>

[Back to Home](../README.md)