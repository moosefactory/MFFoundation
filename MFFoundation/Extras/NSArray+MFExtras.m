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

#import <MFFoundation/NSArray+MFExtras.h>

@implementation NSArray (MFExtras)


-(NSArray*)arrayByRemovingLastObject
{
    NSUInteger count = self.count;
    if (count==0) return self;
    count--;
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:count];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx<count) [array addObject:obj];
    }];
    return [NSArray arrayWithArray:array];
}


-(NSArray*)arrayByRemovingFirstObject
{
    if (self.count==0) return self;
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:self.count-1];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx>0) [array addObject:obj];
    }];
    return [NSArray arrayWithArray:array];
}


-(NSArray*)alphabeticallySortedArray
{
    return [self sortedArrayUsingComparator:^(id obj1, id obj2) {
        return  [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
}


-(NSArray*)reversedArray
{
    NSEnumerator *enumerator = self.reverseObjectEnumerator;
    return enumerator.allObjects;
}

@end
