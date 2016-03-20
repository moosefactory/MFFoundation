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

#import <Foundation/Foundation.h>


/*!
 @discussion This category add convenience methods to the NSData class.
 
 ## Version information
 
 __Version__: 1.0
 
 __Last update__: 2016/03/19
 
 __Developer__:  Tristan Leblanc - MooseFactory Software.
 
 ## Methods
 
 */

@interface NSData (MFExtras)


/** Create an NSData object filled with data defined as an hexadecimal string
 @param bytesString An hexadecimal data string, containing digits "0123456789ABCDEF" ( Lowercases are OK )
 @return A NSData filled with given bytes
 */

+(NSData*)dataWithBytesString:(NSString*)bytesString;

/** Returns NSData bytes as a 'readable' hexadecimal string
 @return An hexadecimal string ( With digits "0123456789abcdef" )
 */

-(NSString*)bytesString;

/** Returns some random data. Common usage is cryptography.
 @param length The length of desired random data
 @return A NSData filled with <length> random bytes
 */

+(NSData *)randomDataOfLength:(NSUInteger)length;

@end
