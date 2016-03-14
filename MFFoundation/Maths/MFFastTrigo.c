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

#include <stdlib.h>
#include <math.h>

static int kMFFastTrigoTableSize;

static double *sinTable;
static double *cosTable;
static double *tanTable;
static double *psinTable;
static double *pcosTable;

extern void buildMFFastTrigoTables()
{
    if (kMFFastTrigoTableSize<1) kMFFastTrigoTableSize = 360;
    sinTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    cosTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    psinTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    pcosTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    tanTable = (double*)malloc(sizeof(double)*kMFFastTrigoTableSize);
    double *sinWritePtr = sinTable;
    double *cosWritePtr = cosTable;
    double *tanWritePtr = tanTable;
    for (int angle=0;angle<kMFFastTrigoTableSize;angle++) {
        *sinWritePtr++ = sin(angle*M_PI/180.0f);
        *cosWritePtr++ = cos(angle*M_PI/180.0f);
        *sinWritePtr++ = ( sin(angle*M_PI/180.0f) + 1.0f ) / 2.0f;
        *cosWritePtr++ = ( cos(angle*M_PI/180.0f) + 1.0f ) / 2.0f;
        *tanWritePtr++ = tan(angle*M_PI/180.0f);
    }
}

/*
inline int angleToIndex(float angle)
{
    long n = angle / (2*M_PI);
    if (angle<0.0f) {
        return angle + (n+1)*2 * M_PI;
    }
    float clampedAngle = angle - n *2* M_PI;
    
    return floor(clampedAngle/(2* M_PI)*(float)(kMFFastTrigoTableSize));
}
*/

extern void tearDownMFFastTrigo()
{
    if (sinTable) free(sinTable);
    if (cosTable) free(cosTable);
    if (tanTable) free(tanTable);
    if (psinTable) free(psinTable);
    if (pcosTable) free(pcosTable);
    kMFFastTrigoTableSize=0;
}

extern double mffsind(long angle)
{
    return sinTable[angle%kMFFastTrigoTableSize];
}

extern double mffcosd(long angle)
{
    return cosTable[angle%kMFFastTrigoTableSize];
}

extern double mfftand(long angle)
{
    return tanTable[angle%kMFFastTrigoTableSize];
}

extern double mffpsind(long angle)
{
    return psinTable[angle%kMFFastTrigoTableSize];
}

extern double mffpcosd(long angle)
{
    return pcosTable[angle%kMFFastTrigoTableSize];
}


