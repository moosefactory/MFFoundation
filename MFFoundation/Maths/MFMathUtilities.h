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

#define MF_PiOnThree    1.047197551196597631317786181171
#define MF_TwoPiOnThree  2.094395102393195262635572362342
 
 /**
@header MMFMath is a collection of extra math functions
 */

    
/** Clamp a double value to the interval [0.0…1.0]
 @return Clamped double value
 */
    
double MF_clampOne(double f);

/** Clamp a float value to the interval [0.0…1.0]
 @return Clamped float value
 */

float MF_clampOnef(float f);

/** Clamp a long double value to the interval [0.0…1.0]
 @return Clamped long double value
 */

long double MF_clampOnel(long double f);

    
    
    
/** Return the modulo of two double values
 
 For example, MF_mod(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )
 
 @return double modulo value
 */

double MF_mod(double x,double d);

/** Return the modulo of two float values
 
 For example, MF_modf(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )
 
 @return float modulo value
 */

float MF_modf(float x,float d);

/** Return the modulo of two long double values
 
 For example, MF_modl(3.5f,1.4f) return 0.7f  ( 1.4f * 2 + 0.7f = 3.5f )
 
 @return long double modulo value
 */

long double MF_modl(long double x,long double d);
    

    
    
/** Clamps any given double angle to a [0-2Pi] interval
 
 For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )
 
 @return double Angle [ 0 - 2Pi ]
 */

double MF_clampAngle(double angle);

    
/** Clamps any given float angle to a [0-2Pi] interval
 
 For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )
 
 @return float Angle [ 0 - 2Pi ]
 */
    
float MF_clampAnglef(float angle);
    
/** Clamps any given long double angle to a [0-2Pi] interval
 
 For example, MF_ClampAngle(7.28f) = 1.0f   ( 1.0f + 6.28f = 7.28f )
 
 @return long double Angle [ 0 - 2Pi ]
 */
    
long double MF_clampAngled(long double angle);

    
/** Computes a 'positive sinus'
 
This function computes ( sin(angle) + 1.0f ) / 2.0f.

The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psin(0) = 0.5f
 
 @return double value
 */
    
double MF_psin(double angle);
    
/** Computes a 'positive sinus'
 
 This function computes ( sin(angle) + 1.0f ) / 2.0f.
 
 The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psinf(0) = 0.5f
 
 @return float value
 */

float MF_psinf(float angle);

/** Computes a 'positive sinus'
 
 This function computes ( sin(angle) + 1.0f ) / 2.0f.
 
 The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_psinl(0) = 0.5f
 
 @return long double value
 */
    
long double MF_psinl(long double angle);

/** Computes a 'positive cosinus'
 
 This function computes ( cos(angle) + 1.0f ) / 2.0f.
 
 The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcos(Pi/2) = 0.5f
 
 @return double value
 */
    
double MF_pcos(double angle);

/** Computes a 'positive cosinus'
 
 This function computes ( cos(angle) + 1.0f ) / 2.0f.
 
 The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcosf(Pi/2) = 0.5f
 
 @return float value
 */

float MF_pcosf(float angle);

/** Computes a 'positive cosinus'
 
 This function computes ( cos(angle) + 1.0f ) / 2.0f.
 
 The result is a mapping of the sin value to a [0.0f…1.0f] interval, with MF_pcosl(Pi/2) = 0.5f
 
 @return long double value
 */

long double MF_pcosl(long double angle);

double MF_max(double f1, double f2);
float MF_maxf(float f1, float f2);
long double MF_maxl(long double f1, long double f2);

double MF_min(double f1, double f2);
float MF_minf(float f1, float f2);
long double MF_minl(long double f1, long double f2);

double MF_max3(double f1, double f2, double f3);
float MF_max3f(float f1, float f2, float f3);
long double MF_max3l(long double f1, long double f2, long double f3);

double MF_min3(double f1, double f2, double f3);
float MF_min3f(float f1, float f2, float f3);
long double MF_min3l(long double f1, long double f2, long double f3);

void MF_cartesianToPolar(double x,double y, double* teta,double *phi);
void MF_cartesianToPolarf(float x,float y, float* teta,float *phi);
void MF_cartesianToPolarl(long double x,long double y, long double* teta,long double *phi);

void MF_polarToCartesian(double teta,double phi,double *x, double *y);
void MF_polarToCartesianf(float teta,float phi,float *x, float *y);
void MF_polarToCartesianl(long double teta,long double phi,long double *x, long double *y);

#ifdef __cplusplus
}
#endif


