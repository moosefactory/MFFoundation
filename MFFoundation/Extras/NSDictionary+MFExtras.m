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

#import <MFFoundation/NSDictionary+MFExtras.h>
#import <MFFoundation/NSArray+MFExtras.h>

@implementation NSDictionary (MFExtras)

+(NSDictionary*)dictionaryWithName:(NSString*)name
{
    return [NSDictionary dictionaryWithName:name type:@"plist"];
}

+(NSDictionary*)dictionaryWithName:(NSString*)name type:(NSString*)type
{
    NSDictionary    *dict = NULL;
    NSURL           *dictURL = [[NSBundle mainBundle] URLForResource:name withExtension:type];

    if (dictURL) {
        dict = [NSDictionary dictionaryWithContentsOfURL:dictURL];
    }
    
    return dict;
}

+(NSDictionary*)localizedDictionaryWithName:(NSString*)name
{
    return [NSDictionary localizedDictionaryWithName:name type:@"plist"];
}

+(NSDictionary*)localizedDictionaryWithName:(NSString*)name type:(NSString*)type
{
    NSDictionary    *localizedDict = NULL;
    NSString        *localizationName = [[NSLocale preferredLanguages] objectAtIndex:0];
    //[[NSLocale autoupdatingCurrentLocale] objectForKey:NSLocaleLanguageCode];
    NSURL           *localizedDictURL = [[NSBundle mainBundle] URLForResource:name withExtension:type subdirectory:[NSString stringWithFormat:@"%@.lproj",localizationName]];
    // If resource doe not exist, we try at root ( resource must have a 'base' localization, or not being localized )
    if (!localizedDictURL) {
        localizedDictURL = [[NSBundle mainBundle] URLForResource:name withExtension:type];
    }
    
    if (localizedDictURL) {
        localizedDict = [NSDictionary dictionaryWithContentsOfURL:localizedDictURL];
    }
    
    return localizedDict;
}

-(NSArray*)alphabeticallySortedKeys
{
    return [[self allKeys] alphabeticallySortedArray];
}


-(id)objectForKey:(id)aKey alternateDictionary:(NSDictionary*)alternateDict
{
    id object = [self objectForKey:aKey];
    if (!object && alternateDict) {
        object = [alternateDict objectForKey:aKey];
    }
    return object;
}

-(id)objectForKey:(id)aKey alternateDictionary:(NSDictionary*)alternateDict alternateKey:(NSString*)alternateKey
{
    id object = [self objectForKey:aKey];
    if (!object && alternateDict) {
        object = [alternateDict objectForKey:alternateKey];
    }
    return object;
}


@end

