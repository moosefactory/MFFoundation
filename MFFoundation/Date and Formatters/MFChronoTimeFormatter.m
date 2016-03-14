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

#import "MFChronoTimeFormatter.h"


@implementation MFChronoTimeFormatter

-(NSString*)stringForObjectValue:(id)object
{
	long time=[object longValue];
	long	time_sec = time / 10;
	long h = time_sec / 3600;
	time_sec -= h*3600;
	long m = time_sec / 60;
	time_sec -= m*60;
	long s = time_sec;
	
	NSString	*timeStr = [[NSString alloc] init];
	if ( h > 0 ) timeStr = [timeStr stringByAppendingFormat:@"%li:",h];
	if ( m > 0 ) timeStr = [timeStr stringByAppendingFormat:@"%02li:",m];
	timeStr = [timeStr stringByAppendingFormat:@"%02li.%li",s,time%10];

	return timeStr;
}

@end
