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

#include "MFMathUtilities.h"


//const long double MF_PiOnThree = M_PI / 3.0f;
//const long double MF_TwoPiOnThree = 2.0f * kPiOnThree;

#pragma mark - MF_clampOne

extern inline double MF_clampOne(double f) {
    if (f>=1.0f) return 1.0f;
    if (f<=0.0f) return 0.0f;
    return f;
}

extern inline float MF_clampOnef(float f) {
    if (f>=1.0f) return 1.0f;
    if (f<=0.0f) return 0.0f;
    return f;
}

extern inline long double MF_clampOnel(long double f) {
    if (f>=1.0f) return 1.0f;
    if (f<=0.0f) return 0.0f;
    return f;
}


#pragma mark - MF_mod

extern inline float MF_modf(float x,float d)
{
    long n = x / d;
    return x - n * d;
}

extern inline double MF_mod(double x,double d)
{
    long n = x / d;
    return x - n * d;
}

extern inline long double MF_modl(long double x,long double d)
{
    long n = x / d;
    return x - n * d;
}



#pragma mark - MF_clampAngle

extern inline double MF_clampAngle(double angle) {
    long n = angle / (2*M_PI);
    if (angle<0.0f) {
        return angle + (n+1)*2 * M_PI;
    }
    return angle - n *2* M_PI;;
}

extern inline float MF_clampAnglef(float angle) {
    long n = angle / (2*M_PI);
    if (angle<0.0f) {
        return angle + (n+1)*2 * M_PI;
    }
    return angle - n *2* M_PI;;
}

extern inline long double MF_clampAnglel(long double angle) {
    long n = angle / (2*M_PI);
    if (angle<0.0f) {
        return angle + (n+1)*2 * M_PI;
    }
    return angle - n *2* M_PI;;
}


#pragma mark - MF_cartesianToPolar

extern void MF_cartesianToPolar(double x,double y, double* teta,double *phi)
{
    *teta = atan2f( y, x );
    *phi = sqrtf( x * x + y * y );
}

extern void MF_cartesianToPolarf(float x,float y, float* teta,float *phi)
{
    *teta = atan2f( y, x );
    *phi = sqrtf( x * x + y * y );
}

extern void MF_cartesianToPolarl(long double x,long double y, long double* teta,long double *phi)
{
    *teta = atan2f( y, x );
    *phi = sqrtf( x * x + y * y );
}

#pragma mark - MF_polarToCartesian

extern void MF_polarToCartesian(double teta,double phi,double *x, double *y)
{
    *x = cosf(teta)*phi;
    *y = sinf(teta)*phi;
}

extern void MF_polarToCartesianf(float teta,float phi,float *x, float *y)
{
    *x = cosf(teta)*phi;
    *y = sinf(teta)*phi;
}

extern void MF_polarToCartesianl(long double teta,long double phi,long double *x, long double *y)
{
    *x = cosf(teta)*phi;
    *y = sinf(teta)*phi;
}


#pragma mark - Positive (0..1) trigo Computation

extern double MF_psin(double angle)
{
    return ( sin(angle) + 1.0f ) / 2.0f;
}

extern float MF_psinf(float angle)
{
    return ( sin(angle) + 1.0f ) / 2.0f;
}

extern long double MF_psinl(long double angle)
{
    return ( sin(angle) + 1.0f ) / 2.0f;
}



extern double MF_pcos(double angle)
{
    return ( cos(angle) + 1.0f ) / 2.0f;
}

extern float MF_pcosf(float angle)
{
    return ( cos(angle) + 1.0f ) / 2.0f;
}

extern long double MF_pcosl(long double angle)
{
    return ( cos(angle) + 1.0f ) / 2.0f;
}

#pragma mark - Min/Max Computation

extern double MF_max(double f1, double f2)
{
    if ( f1 > f2 ) return f1;
    return f2;
}

extern float MF_maxf(float f1, float f2)
{
    if ( f1 > f2 ) return f1;
    return f2;
}

extern long double MF_maxl(long double f1, long double f2)
{
    if ( f1 > f2 ) return f1;
    return f2;
}



extern double MF_min(double f1, double f2)
{
    if ( f1 < f2 ) return f1;
    return f2;
}

extern float MF_minf(float f1, float f2)
{
    if ( f1 < f2 ) return f1;
    return f2;
}

extern long double MF_minl(long double f1, long double f2)
{
    if ( f1 < f2 ) return f1;
    return f2;
}



extern double MF_max3(double f1, double f2, double f3)
{
    if ( f1 > f2 ) {
        if ( f1 > f3 ) return f1;
        else {
            if (f3 > f2) {
                return f3;
            }
            else return f2;
        }
    } else {
        if ( f2 > f3 ) {
            return f2;
        }
        else return f3;
    }
}

extern float MF_max3f(float f1, float f2, float f3)
{
    if ( f1 > f2 ) {
        if ( f1 > f3 ) return f1;
        else {
            if (f3 > f2) {
                return f3;
            }
            else return f2;
        }
    } else {
        if ( f2 > f3 ) {
            return f2;
        }
        else return f3;
    }
}

extern long double MF_max3l(long double f1, long double f2, long double f3)
{
    if ( f1 > f2 ) {
        if ( f1 > f3 ) return f1;
        else {
            if (f3 > f2) {
                return f3;
            }
            else return f2;
        }
    } else {
        if ( f2 > f3 ) {
            return f2;
        }
        else return f3;
    }
}



extern double MF_min3(double f1, double f2, double f3)
{
    if ( f1 < f2 ) {
        if ( f1 < f3 ) return f1;
        else {
            if (f3 < f2) {
                return f3;
            } else {
                return f2;
            }
        }
    } else {
        if ( f2 < f3 ) {
            return f2;
        } else {
            return f3;
        }
    }
}

extern float MF_min3f(float f1, float f2, float f3)
{
    if ( f1 < f2 ) {
        if ( f1 < f3 ) return f1;
        else {
            if (f3 < f2) {
                return f3;
            } else {
                return f2;
            }
        }
    } else {
        if ( f2 < f3 ) {
            return f2;
        } else {
            return f3;
        }
    }
}

extern long double MF_min3l(long double f1, long double f2, long double f3)
{
    if ( f1 < f2 ) {
        if ( f1 < f3 ) return f1;
        else {
            if (f3 < f2) {
                return f3;
            } else {
                return f2;
            }
        }
    } else {
        if ( f2 < f3 ) {
            return f2;
        } else {
            return f3;
        }
    }
}
