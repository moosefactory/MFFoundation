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

/** MFDateUtils is a static utility class

 It defines some constants and static functions.
 
 Constants:
     typedef enum {
     MFDaysSelector_Monday       = 1,
     MFDaysSelector_Tuesday      = 2,
     MFDaysSelector_Wedenesday   = 4,
     MFDaysSelector_Thursday     = 8,
     MFDaysSelector_Friday       = 16,
     MFDaysSelector_Saturday     = 32,
     MFDaysSelector_Sunday       = 64
     } MFDaysSelectorFlag;
 */

typedef enum {
    MFDaysSelector_Monday       = 1,
    MFDaysSelector_Tuesday      = 2,
    MFDaysSelector_Wedenesday   = 4,
    MFDaysSelector_Thursday     = 8,
    MFDaysSelector_Friday       = 16,
    MFDaysSelector_Saturday     = 32,
    MFDaysSelector_Sunday       = 64
} MFDaysSelectorFlag;

typedef NSUInteger MFDaysSelectorMask;

const extern MFDaysSelectorMask    MFDaysSelectorWorkingDays;
const extern MFDaysSelectorMask    MFDaysSelectorWeekEndDays;
const extern MFDaysSelectorMask    MFDaysSelectorEveryDay;
const extern MFDaysSelectorMask    MFDaysSelectorNoDays;

@interface MFDateUtils : NSObject

// Formatters

/** Returns an rfc3339 date formatter
 
 The rfc3339 is the format used by Unix, and is commonly used in url requests.
 
 @return A rfc3339 NSDateFormatter
 */

+(NSDateFormatter*)rfc3339DateFormatter;

/** Returns an short date formatter
 
 The rfc3339 is the format used by Unix, and is commonly used in url requests.
 
 @return A rfc3339 NSDateFormatter
 */

+(NSDateFormatter*)shortDateFormatter;

// Utils

+(NSDate*)dayStartDate;
+(NSDate*)weekStartDate;
+(NSDate*)previousWeekStartDate;
+(NSDate*)yesterdayStartDate;

+(NSDate*)beginOfMonthDateForDate:(NSDate*)date;
+(NSDate*)endOfMonthDateForDate:(NSDate*)date;


@end
