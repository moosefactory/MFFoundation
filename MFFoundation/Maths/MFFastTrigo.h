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
@discussion A collection of very fast function to compute trigonometric functions.
These functions only works with integer angle in degrees ( from 0 to 359 ).
 
Warning : To ensure very high performance, there is no guards. Be sure to pass an angle from 0 to 359.
 
@updated 2016-03-20
@author Tristan Leblanc
@copyright 2016 Tristan Leblanc - MooseFactory Software
@encoding utf-8
@version 1.0.0
@unsorted
*/


#ifndef MFFastTrigo_MFFastTrigo_h
/*!
 @define MFFastTrigo_MFFastTrigo_h
 @parseOnly
 */
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
@function buildMFFastTrigoTables
@abstract Use buildMFFastTrigoTables before calling any MFFastTrigo function.
@discussion Calling this function allocates static tables with pre-computed trigo function return values.
 */
        
void buildMFFastTrigoTables();

/*!
 @function tearDownMFFastTrigo
 @abstract Flush the memory allocated to store tables
 */

void tearDownMFFastTrigo();
        
/*!
 @function mffsind
 @abstract Returns the sinus of a given angle ( integer value, in degrees )
 @param angle An integer angle between 0 and 359
 @result The sinus of the angle ( double value )
*/
        
double mffsind(long angle);

/*!
 @function mffcosd
 @abstract Returns the cosinus of a given angle ( integer value, in degrees )
 @param angle An integer angle between 0 and 359
 @result The cosinus of the angle ( double value )
 */
double mffcosd(long angle);

/*!
 @function mfftand
 @abstract Returns the tangent of a given angle ( integer value, in degrees )
 @param angle An integer angle between 0 and 359
 @result The tangent of the angle ( double value )
*/

double mfftand(long angle);


/*!
 @function mffpsind
 @abstract  Returns the sinus, mapped to interval [0.0…1.0f], of a given angle ( integer value, in degrees )
 @param angle An integer angle between 0 and 359
 @result The sinus of the angle, mapped to [0.0f…1.0f] ( double value )
 */
double mffpsind(long angle);

/*!
 @function mffpcosd
 @abstract  Return the cosinus, mapped to interval [0.0…1.0f], of a given angle ( integer value, in degrees )
 @param angle An integer angle between 0 and 359
 @result The cosinus of the angle, mapped to [0.0f…1.0f] ( double value )
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
