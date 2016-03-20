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

/**
@header Fast Trigo computation.
*/

#ifndef MFFastTrigo_MFFastTrigo_h
#define MFFastTrigo_MFFastTrigo_h

#ifdef __cplusplus
extern "C" {
#endif

    /*
#ifdef __c
    extern {
#endif
  */

        
        
/*!
Use buildMFFastTrigoTables before calling any MFFastTrigo function.
Calling this function allocates static tables with pre-computed trigo function return values.
 */
        
void buildMFFastTrigoTables();

/*!
 Flush the memory allocated to store tables
 */

void tearDownMFFastTrigo();
        
/*!
 Return the sinus of a given angle ( integer value, in degrees )
 */
        
double mffsind(long angle);

/*!
 Return the cosinus of a given angle ( integer value, in degrees )
 */
double mffcosd(long angle);

/*!
 Return the tangent of a given angle ( integer value, in degrees )
 */

double mfftand(long angle);


/*!
 Return the sinus, mapped to interval [0.0…1.0f], of a given angle ( integer value, in degrees )
 */
double mffpsind(long angle);

/*!
 Return the cosinus, mapped to interval [0.0…1.0f], of a given angle ( integer value, in degrees )
 */
double mffpcosd(long angle);
        
#ifdef __cplusplus
}
#endif

/*
#ifdef __c
}
#endif
*/

#endif
