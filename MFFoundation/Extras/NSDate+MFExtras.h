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

/** Defines a set of convenient methods, often used in time / calendar based applications.
 */

@interface NSDate (MFExtras)

/** Returns a copy of the date with hours, minutes and seconds set to 0.
 @return NSDate
 */

-(NSDate*)dateByClearingTime;

/** Returns a copy of the date with hour and minute set to passed values. seconds set to 0.
 @param hour The hour the new date must be set
 @param minute The minute the new date must be set
 @return A copy of the passed NSDate, with hour and minute set to given ones */

-(NSDate*)dateBySettingHour:(NSUInteger)hour minute:(NSUInteger)minute;

/** Returns true if date is the same day as passed date.
 @param date The date to match
 @return Boolean - YES if the passed date is the same day as target date
 */

-(BOOL)isSameDayAsDate:(NSDate*)date;

/** Returns true if date is the same month as passed date.
 @param date The date to match
 @return Boolean - YES if the passed date is the same month as target date
 */

-(BOOL)isSameMonthAsDate:(NSDate*)date;

/** Returns a copy of the date, one month later.
 @return NSDate
 */

-(NSDate*)oneMonthLater;

/** Returns a copy of the date, one month earlier.
 @return NSDate
*/

-(NSDate*)oneMonthEarlier;

/** Returns a copy of the date, one day later.
 @return NSDate
 */

-(NSDate*)oneDayLater;

/** Returns a copy of the date, one day earlier.
 @return NSDate
 */

-(NSDate*)oneDayEarlier;

/** Returns the number of seconds since the beginning of the day ( midnight of previous day ).
 @return Integer number of seconds since the start of day.
 */

-(NSUInteger)secondsSinceStartOfDay;

/**Returns date components, based on auto-updating system calendar
 @return Date components of this date.
 */

-(NSDateComponents*)components;

@end
