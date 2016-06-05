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

#import <MFFoundation/MFChronoTimeFormatter.h>


@implementation MFChronoTimeFormatter

-(id)init
{
    if ( self = [super init] ) {
        _displayHours = YES;
        _displayZeros = YES;
        _displayHoursZeros = NO;
        _displaySeconds = YES;
    }
    return self;
}

// Time in milliseconds

-(NSString*)stringForObjectValue:(id)object
{
	long time=[object longValue];
	long time_sec = time / 1000;
	long h = time_sec / 3600;
	time_sec -= h*3600;
	long m = time_sec / 60;
	time_sec -= m*60;
	long s = time_sec;
	
	NSString	*timeStr = [[NSString alloc] init];
    if (_displayHours) {
        if ( h > 0 ) timeStr = [timeStr stringByAppendingFormat:@"%02li:",h];
        else if (_displayHoursZeros ) {
            [timeStr stringByAppendingString:@"00:"];
        }
    }
	if ( m > 0 ) timeStr = [timeStr stringByAppendingFormat:@"%02li:",m];
    else if (_displayZeros ) {
        [timeStr stringByAppendingString:@"00:"];
    }
    
    if (_displaySeconds) {
        timeStr = [timeStr stringByAppendingFormat:@"%02li",s];
        
        if (_displayMilliseconds)
            timeStr = [timeStr stringByAppendingFormat:@".%03li",time % 1000];
        else if (_displayHundredth)
            timeStr = [timeStr stringByAppendingFormat:@".%02li",time % 100];
        else if (_displayTenth)
            timeStr = [timeStr stringByAppendingFormat:@".%01li",time % 10];
    }
	return timeStr;
}

@end
