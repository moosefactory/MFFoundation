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
 @discussion This category add convenience methods to the NSStrings class.
 
 ## Version information
 
 __Version__: 1.0
 
 __Last update__: 2016/03/19
 
 __Developer__:  Tristan Leblanc - MooseFactory Software.
 
 ## Methods
 
 */

@interface NSString ( MFExtras )

/** Creates a Universally Unique Identifier (UUID)
 @returns a unique ID string.
 */

+(NSString*)UUIDString;



/** Returns the md5 hash of the string.
 @return NSString
 */

-(NSString*)md5;




/** Returns the sha1 hash of the string.
 @return NSString
 */

-(NSString *)sha1;



/** Returns true if passed eMail is valid. 
 Pass true in the 'strict' parameter to do a strict checking
 @param strict Set to YES for strict eMail checking
 @return BOOL - YES if email syntax is valid
 */

-(BOOL)isValidEmail:(BOOL)strict;




/**Returns true if the string is a correct name ( Roman language only )
 @return BOOL - YES if name syntax is valid
*/

-(BOOL)isValidName;



/** Convenient function to add escape percent characters (to use in an url string)
 @return NSString containing percent escapes
 */

-(NSString*)urlEncode;



/** Convenient function to decode an url style string ( with escape percent characters)
@return NSString 
 */

-(NSString*)urlDecode;

@end
