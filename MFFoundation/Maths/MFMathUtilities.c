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

const   float kPiOnThree = M_PI / 3.0f;
const   float kTwoPiOnThree = 2.0f * kPiOnThree;

extern inline float MF_clampOne(float f) {
    if (f>=1.0f) return 1.0f;
    if (f<=0.0f) return 0.0f;
    return f;
}

extern inline float MF_modf(float x,float d)
{
    long n = x / d;
    return x - n * d;
}

extern inline float MF_clampAngle(float angle) {
    long n = angle / (2*M_PI);
    if (angle<0.0f) {
        return angle + (n+1)*2 * M_PI;
    }
    return angle - n *2* M_PI;;
}

extern void MF_cartesianToPolar(float x,float y, float* teta,float *phi)
{
    *teta = atan2f( y, x );
    *phi = sqrtf( x * x + y * y );
}

extern void MF_polarToCartesian(float teta,float phi,float *x, float *y)
{
    *x = cosf(teta)*phi;
    *y = sinf(teta)*phi;
}


#pragma mark - Positive (0..1) trigo Computation

extern double mfpsin(double angle)
{
    return ( sin(angle) + 1.0f ) / 2.0f;
}

extern double mfpcos(double angle)
{
    return ( cos(angle) + 1.0f ) / 2.0f;
}

#pragma mark - Min/Max Computation

extern float MF_maxf(float f1, float f2)
{
    if ( f1 > f2 ) return f1;
    return f2;
}

extern float MF_minf(float f1, float f2)
{
    if ( f1 < f2 ) return f1;
    return f2;
}

extern float MF_max3f(float f1, float f2, float f3)
{
    if ( f1 > f2 ) {
        if ( f1 > f3 ) return f1;
        else {
            if (f3 > f2) {
                return f3;
            }
        }
    }
    return f2;
}

extern float MF_min3f(float f1, float f2, float f3)
{
    if ( f1 < f2 ) {
        if ( f1 < f3 ) return f1;
        else {
            if (f3 < f2) {
                return f3;
            }
        }
    }
    return f2;
}
