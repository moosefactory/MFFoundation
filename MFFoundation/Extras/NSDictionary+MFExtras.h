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
 @discussion This category add convenience methods to the NSDictionary class.
 
 ## Version information
 
 __Version__: 1.0
 
 __Last update__: 2016/03/19
 
 __Developer__:  Tristan Leblanc - MooseFactory Software.
 
 ## Methods
 
 */

@interface NSDictionary (MFExtras)

/** Returns a dictionary from a plist file in the main bundle.
 @param name The name of the 'plist' dictionary file.
 @return NSDictionary.
*/

+(NSDictionary*)dictionaryWithName:(NSString*)name;

/** Returns a dictionary from a file in the main bundle.
 Set type to 'plist', or 'strings' to load strings files as dictionaries.
 @param name The name of the dictionary file.
 @param type The type of file to parse - 'plist' or 'strings'.
 @return NSDictionary.
 */

+(NSDictionary*)dictionaryWithName:(NSString*)name type:(NSString*)type;

/** Returns a localized dictionary from a plist file in the main bundle.
 Returns base version if localized version can't be found
 @param name The name of the 'plist' or 'strings' dictionary file.
 @return NSDictionary.
 */

+(NSDictionary*)localizedDictionaryWithName:(NSString*)name;

/** Returns a localized dictionary from a plist file in the main bundle.
 Returns base version if localized version can't be found
 Set type to 'plist', or 'strings' to load strings files as dictionaries.
 @param name The name of the 'plist' or 'strings' dictionary file.
 @param type The type of file to parse - 'plist' or 'strings'.
 @return NSDictionary.
 */

+(NSDictionary*)localizedDictionaryWithName:(NSString*)name type:(NSString*)type;

/** Returns an array containing the dictionary keys, sorted alphabetically
 @return NSArray containing sorted keys.  */

-(NSArray*)alphabeticallySortedKeys;




/** Search in an alternate dictionary in case the key is not found at first.
 @param alternateDict The alternate dictionary.
 @return The object with key in the dictionary, or in the alternate dictionary. NULL if not found.
 */

-(id)objectForKey:(id)aKey alternateDictionary:(NSDictionary*)alternateDict;




/** Search in an alternate dictionary with an alternate key in case the key is not found at first.
 @param alternateDict The alternate dictionary.
 @param alternateKey The alternate key to use when searching in the alternate dictionary.
 @return The object with key in the dictionary, or the object with alternate key in the alternate dictionary. NULL if not found.
 */

-(id)objectForKey:(id)aKey alternateDictionary:(NSDictionary*)alternateDict alternateKey:(NSString*)alternateKey;

@end
