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

#import <MFFoundation/NSFileManager+MFExtras.h>
    
@implementation NSFileManager (MFExtras)

-(BOOL)isPathDirectoryEmpty:(NSString*)path  isDirectory:(BOOL*)isDirectory fileExists:(BOOL*)fileExists
{
    BOOL isDir;
    if ( [self fileExistsAtPath:path isDirectory:&isDir] ) {
        *fileExists = YES;
        *isDirectory = isDir;
        // if item is a directory, check content
        if (isDir) {
            NSError*    error;
            NSArray* contents = [self contentsOfDirectoryAtPath:path error:&error];
            if (!contents || !contents.count) return true;
            return false;
        }
        // Not a directory , return false;
        else {
            return false;
        }
    }
    return false;
}


-(BOOL)isPathDirectoryEmpty:(NSString*)path  isDirectory:(BOOL*)isDirectory fileExists:(BOOL*)fileExists recursive:(BOOL)recursive
{
    if (!recursive) {
        return [self isPathDirectoryEmpty:path isDirectory:isDirectory fileExists:fileExists recursive:recursive];
    }
    BOOL isDir;
    if ( [self fileExistsAtPath:path isDirectory:&isDir] ) {
        *fileExists = YES;
        *isDirectory = isDir;
        // if item is a directory, check content
        if (isDir) {
            NSError*    error;
            NSArray* contents = [self contentsOfDirectoryAtPath:path error:&error];
            // if no contents, dir is empty ! return true
            if (!contents || !contents.count) return true;
            
            
            //  recursive, check items
            for (NSString* anItem in contents) {
                // if not item recursively empty, return false
                BOOL exists;
                if ( ![self isPathDirectoryEmpty:[path stringByAppendingPathComponent:anItem] isDirectory:&isDir fileExists:&exists recursive:YES]) {
                    return false;
                }
            }
            // not breaked, all items were empty directories
            return true;
        }
        // Not a directory , return false;
        else {
            return false;
        }
    }
    return false;
}

-(BOOL)directoryContainsOnlyInvisibleFiles:(NSString*)path containsInvisibleFolders:(BOOL*)containsInvisibleFolders
{
    BOOL isDir;
    
    if ( [self fileExistsAtPath:path isDirectory:&isDir] ) {
        // if item is a directory, check content
        NSError*    error;
        NSArray* contents = [self contentsOfDirectoryAtPath:path error:&error];
        for (NSString* anItem in contents) {
            if (![[anItem substringToIndex:1] isEqualToString:@"."]) return NO;
            
            NSString* subPath = [path stringByAppendingPathComponent:anItem];
            [self fileExistsAtPath:subPath isDirectory:containsInvisibleFolders];
        }
        return YES; // dir contains only invisible files
    }
    return false; // file not exists, is not dir...
}

-(BOOL)directoryContainsOnlyInvisibleFiles:(NSString*)path containsInvisibleFolders:(BOOL*)containsInvisibleFolders recursive:(BOOL)recursive
{
    BOOL isDir;
    if (!recursive) {
        return [self directoryContainsOnlyInvisibleFiles:path containsInvisibleFolders:containsInvisibleFolders];
    }
    if ( [self fileExistsAtPath:path isDirectory:&isDir] ) {
        NSError*    error;
        NSArray* contents = [self contentsOfDirectoryAtPath:path error:&error];
        for (NSString* anItem in contents) {
            NSString* subPath = [path stringByAppendingPathComponent:anItem];
            if (![self directoryContainsOnlyInvisibleFiles:subPath containsInvisibleFolders:containsInvisibleFolders]) {
                return NO;
            }
        }
        return YES; // dir recursively contains only invisible files
    }
    return false; // file not exists, is not dir...
}

@end
