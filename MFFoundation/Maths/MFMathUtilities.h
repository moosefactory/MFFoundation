/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Foundation - v1.0.0                    */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2016 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

/*
Copyright (c) 2016 Tristan Leblanc - MooseFactory Software <tristan@moosefactory.eu>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#include <stdio.h>
#include <math.h>

#ifdef __cplusplus
extern "C" {
#endif

    /**
     @define MF_PiOnThree
     @discussion Pre-Computed value of Pi/3
     */
#define MF_PiOnThree    1.047197551196597631317786181171
    /**
     @define MF_TwoPiOnThree
     @discussion Pre-Computed value of 2Pi/3
     */
#define MF_TwoPiOnThree  2.094395102393195262635572362342


/**
 @header MooseFactory Maths Utilities
 @discussion A collection of extra math functions.
 @updated 2016-03-20
 @author Tristan Leblanc
 @copyright 2016 Tristan Leblanc - MooseFactory Software
 @encoding utf-8
 @version 1.0.0
 @unsorted
 */


#pragma mark - Clamp

/**
@function MF_clampOne
@abstract Clamp a double value to the interval [0.0…1.0]
@param value a double value
@return Clamped double value
@indexgroup Clamping
*/

double MF_clampOne(double value);

/**
 @function MF_clampOnef
 @abstract Clamp a float value to the interval [0.0…1.0]
@return Clamped float value
 @param value a float value
 @indexgroup Clamping
*/

float MF_clampOnef(float value);

/**
 @function MF_clampOnel
 @abstract Clamp a long double value to the interval [0.0…1.0]
@return Clamped long double value
 @param value a long double value
 @indexgroup Clamping
*/

long double MF_clampOnel(long double value);


#pragma mark - Modulo


/**
 @function MF_mod
 @abstract Return the modulo of two double values

For example, MF_mod(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )

@return double modulo value
 @indexgroup Modulo
*/

double MF_mod(double x,double d);

/**
 @function MF_modf
 @abstract Return the modulo of two float values

For example, MF_modf(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )

@return float modulo value
 @indexgroup Modulo
*/

float MF_modf(float x,float d);

/**
 @function MF_modl
 @abstract Return the modulo of two long double values

For example, MF_modl(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )

@return long double modulo value
 @indexgroup Modulo
*/

long double MF_modl(long double x,long double d);



#pragma mark - Trigo
    
/**
 @function MF_clampAngle
 @abstract Clamps any given double angle to a [0-2Pi] interval

For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )

@return double Angle [ 0 - 2Pi ]
 @indexgroup Trigo
 */

double MF_clampAngle(double angle);


/**
 @function MF_clampAnglef
 @abstract Clamps any given float angle to a [0-2Pi] interval

For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )

@return float Angle [ 0 - 2Pi ]
 @indexgroup Trigo
 */

float MF_clampAnglef(float angle);

/**
 @function MF_clampAnglel
 @abstract Clamps any given long double angle to a [0-2Pi] interval

For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )

@return long double Angle [ 0 - 2Pi ]
 @indexgroup Trigo
 */

long double MF_clampAnglel(long double angle);


/**
 @function MF_psin
 @abstract Computes a 'positive sinus'

This function computes ( sin(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psin(0) = 0.5f

@return double value
 @indexgroup Trigo
 */

double MF_psin(double angle);

/**
 @function MF_psinf
 @abstract Computes a 'positive sinus'

This function computes ( sin(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psinf(0) = 0.5f

@return float value
  @indexgroup Trigo
*/

float MF_psinf(float angle);

/**
 @function MF_psinl
 @abstract Computes a 'positive sinus'

This function computes ( sin(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psinl(0) = 0.5f

@return long double value
  @indexgroup Trigo
*/

long double MF_psinl(long double angle);

/**
 @function MF_pcos
 @abstract Computes a 'positive cosinus'

This function computes ( cos(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcos(Pi/2) = 0.5f

@return double value
  @indexgroup Trigo
*/

double MF_pcos(double angle);

/**
 @function MF_pcosf
 @abstract Computes a 'positive cosinus'

This function computes ( cos(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcosf(Pi/2) = 0.5f

@return float value
  @indexgroup Trigo
*/

float MF_pcosf(float angle);

/**
 @function MF_pcosl
 @abstract Computes a 'positive cosinus'

This function computes ( cos(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcosl(Pi/2) = 0.5f

@return long double value
  @indexgroup Trigo
*/

long double MF_pcosl(long double angle);

    /**
     @function MF_cartesianToPolar
     @abstract Convert a cartesian coordinates to polar coordinates
     @return Polar coordinate ( teta, phi ) in double values
     @param x The x value of the coordinate to convert
     @param y the y value of the coordinate to convert
     @indexgroup Trigo
     */
    void MF_cartesianToPolar(double x,double y, double* teta,double *phi);
    /**
     @function MF_cartesianToPolarf
     @abstract Convert a cartesian coordinates to polar coordinates
     @return Polar coordinate ( teta, phi ) in float values
     @param x The x value of the coordinate to convert
     @param y the y value of the coordinate to convert
     @indexgroup Trigo
     */
    void MF_cartesianToPolarf(float x,float y, float* teta,float *phi);
    /**
     @function MF_cartesianToPolarl
     @abstract Convert a cartesian coordinates to polar coordinates
     @return Polar coordinate ( teta, phi ) in long double values
     @param x The x value of the coordinate to convert
     @param y the y value of the coordinate to convert
     @indexgroup Trigo
     */
    void MF_cartesianToPolarl(long double x,long double y, long double* teta,long double *phi);
    
    /**
     @function MF_polarToCartesian
     @abstract Convert a polar coordinates to cartesian coordinates
     @return Cartesian coordinate ( x, y ) in double values
     @param teta The teta value ( angle ) of the coordinate to convert
     @param phi the phi value ( vector length ) of the coordinate to convert
     @indexgroup Trigo
     */
    void MF_polarToCartesian(double teta,double phi,double *x, double *y);
    /**
     @function MF_polarToCartesianf
     @abstract Convert a polar coordinates to cartesian coordinates
     @return Cartesian coordinate ( x, y ) in float values
     @param teta The teta value ( angle ) of the coordinate to convert
     @param phi the phi value ( vector length ) of the coordinate to convert
     @indexgroup Trigo
     */
   void MF_polarToCartesianf(float teta,float phi,float *x, float *y);
    /**
     @function MF_polarToCartesianl
     @abstract Convert a polar coordinates to cartesian coordinates
     @return Cartesian coordinate ( x, y ) in long double values
     @param teta The teta value ( angle ) of the coordinate to convert
     @param phi the phi value ( vector length ) of the coordinate to convert
     @indexgroup Trigo
     */
    void MF_polarToCartesianl(long double teta,long double phi,long double *x, long double *y);

#pragma mark - Comparison
    
    /**
     @function MF_max
     @abstract Compares two given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a double value
     @param f2 a double value
     */
double MF_max(double f1, double f2);
    /**
     @function MF_maxf
     @abstract Compares two given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a float value
     @param f2 a float value
     */
float MF_maxf(float f1, float f2);
    /**
     @function MF_maxl
     @abstract Compares two given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a long double value
     @param f2 a long double value
     */
long double MF_maxl(long double f1, long double f2);

    /**
     @function MF_min
     @abstract Compares two given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a double value
     @param f2 a double value
     */
double MF_min(double f1, double f2);
    /**
     @function MF_minf
     @abstract Compares two given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a float value
     @param f2 a float value
     */
float MF_minf(float f1, float f2);
    /**
     @function MF_minl
     @abstract Compares two given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a long double value
     @param f2 a long double value
     */
long double MF_minl(long double f1, long double f2);

    /**
     @function MF_max3
     @abstract Compares three given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a double value
     @param f2 a double value
     @param f3 a double value
     */
double MF_max3(double f1, double f2, double f3);
    /**
     @function MF_max3f
     @abstract Compares three given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a float value
     @param f2 a float value
     @param f3 a float value
     */
float MF_max3f(float f1, float f2, float f3);
    /**
     @function MF_max3l
     @abstract Compares three given values
     @return The bigger of the given values
     @indexgroup Comparison
     @param f1 a long double value
     @param f2 a long double value
     @param f3 a long double value
     */
long double MF_max3l(long double f1, long double f2, long double f3);

    /**
     @function MF_min3
     @abstract Compares three given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a double value
     @param f2 a double value
     @param f3 a double value
     */
double MF_min3(double f1, double f2, double f3);
    /**
     @function MF_min3f
     @abstract Compares three given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a float value
     @param f2 a float value
     @param f3 a float value
     */
float MF_min3f(float f1, float f2, float f3);
    /**
     @function MF_min3l
     @abstract Compares three given values
     @return The smaller of the given values
     @indexgroup Comparison
     @param f1 a long double value
     @param f2 a long double value
     @param f3 a long double value
     */
long double MF_min3l(long double f1, long double f2, long double f3);


#ifdef __cplusplus
}
#endif


