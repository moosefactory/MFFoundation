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
 @discussion This category add convenience methods to the NSFileManager class.
 
 ## Version information
 
 __Version__: 1.0
 
 __Last update__: 2016/03/19
 
 __Developer__:  Tristan Leblanc - MooseFactory Software.
 
 ## Methods
 
 */

@interface NSFileManager (MFExtras)

/** Returns true if a given directory is empty.
 @param path The path of the file item to test
 @param isDirectory  Set to YES on output if the given path is a directory
 @param fileExists  Set to YES on output if the file item exists
 */

-(BOOL)isPathDirectoryEmpty:(NSString*)path  isDirectory:(BOOL*)isDirectory fileExists:(BOOL*)fileExists;



/** Returns true if a given directory is recursively empty.
 @param path The path of the file item to test
 @param isDirectory  Set to YES on output if the given path is a directory
 @param fileExists  Set to YES on output if the file item exists
 
 */

-(BOOL)isPathDirectoryEmpty:(NSString*)path  isDirectory:(BOOL*)isDirectory fileExists:(BOOL*)fileExists recursive:(BOOL)recursive;




/** Returns true if a given directory contains only invisible files.

 return YES in containsInvisibleFolders if the folder contains invisible folders.
 
 For performances reason, the algorithm breaks at first visible file.
 So if folder does not contains only invisible files, containsInvisibleFolders has no meaning.
 @param path The path of the item to test
 @param containsInvisibleFolders  Set to YES on output if the folder only contains invisible files and has invisible folders
 */

-(BOOL)directoryContainsOnlyInvisibleFiles:(NSString*)path containsInvisibleFolders:(BOOL*)containsInvisibleFolders;


/** Returns true if a given directory contains only invisible files.
 
 return YES in containsInvisibleFolders if the folder contains invisible folders.
 
 For performances reason, the algorithm breaks at first visible file.
 So if folder does not contains only invisible files, containsInvisibleFolders has no meaning.
 @param path The path of the item to test
 @param containsInvisibleFolders  Set to YES on output if the folder only contains invisible files and has invisible folders
 @param recursive If YES, checks recursively.
 */

-(BOOL)directoryContainsOnlyInvisibleFiles:(NSString*)path containsInvisibleFolders:(BOOL*)containsInvisibleFolders recursive:(BOOL)recursive;


@end
