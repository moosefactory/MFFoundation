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

#import "MFDateUtils.h"

static const NSInteger MFDateSecsPerDay = 24*60*60;

const MFDaysSelectorMask    MFDaysSelectorWorkingDays = MFDaysSelector_Monday | MFDaysSelector_Tuesday | MFDaysSelector_Wedenesday | MFDaysSelector_Thursday | MFDaysSelector_Friday;
const MFDaysSelectorMask    MFDaysSelectorWeekEndDays = MFDaysSelector_Saturday | MFDaysSelector_Sunday;
const MFDaysSelectorMask    MFDaysSelectorEveryDay = MFDaysSelectorWorkingDays | MFDaysSelectorWeekEndDays;
const MFDaysSelectorMask    MFDaysSelectorNoDays = 0;

@implementation MFDateUtils

#pragma mark - Formatters

+(NSDateFormatter*)rfc3339DateFormatter
{
    static NSDateFormatter* sRFC3339DateFormatter;
    
    if (!sRFC3339DateFormatter) {
        sRFC3339DateFormatter= [[NSDateFormatter alloc] init];
        
        NSLocale* enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
        
        [sRFC3339DateFormatter setLocale:enUSPOSIXLocale];
        [sRFC3339DateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH:mm:ssZ"];
        [sRFC3339DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    }
    return sRFC3339DateFormatter;
}

+(NSDateFormatter*)shortDateFormatter
{
    static NSDateFormatter* sShortDateFormatter;
    
    if (!sShortDateFormatter) {
        sShortDateFormatter= [[NSDateFormatter alloc] init];
        [sShortDateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return sShortDateFormatter;
}

#pragma mark - Utils

+(NSDate*)dayStartDate
{
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* comps = [cal components:kCFCalendarUnitYear|kCFCalendarUnitMonth|kCFCalendarUnitDay|kCFCalendarUnitHour|kCFCalendarUnitMinute|kCFCalendarUnitSecond fromDate:[NSDate date]];
    NSInteger hour = comps.hour;
    comps.hour = 4;
    comps.minute = 0;
    comps.second = 0;
    
    NSDate* date = [cal dateFromComponents:comps];
    if (hour<4) {
        date = [date dateByAddingTimeInterval:-MFDateSecsPerDay];
    }
#if DEBUG
    NSLog(@"Day Start :%@",date);
#endif
    return date;
}

+(NSDate*)weekStartDate
{
    NSDate* date = [ [self dayStartDate] dateByAddingTimeInterval:-7*MFDateSecsPerDay ];
#if DEBUG
    NSLog(@"Week Start :%@",date);
#endif
    return date;
}

+(NSDate*)previousWeekStartDate
{
    NSDate* date = [ [self dayStartDate] dateByAddingTimeInterval:-14*MFDateSecsPerDay ];
#if DEBUG
    NSLog(@"Previous Week Start :%@",date);
#endif
    return date;
}

+(NSDate*)yesterdayStartDate
{
    NSDate *dayStartDate = [MFDateUtils dayStartDate];
    NSDate *yesterdayStartDate = [dayStartDate dateByAddingTimeInterval:-MFDateSecsPerDay];
    return yesterdayStartDate;
}

+(NSDate*)beginOfMonthDateForDate:(NSDate*)date
{
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear fromDate:date];
    comps.day = 1;
    NSDate* firstDayDate = [cal dateFromComponents:comps];
    return firstDayDate;
}


+(NSDate*)endOfMonthDateForDate:(NSDate*)date
{
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear fromDate:date];
    comps.day = 1;
    NSDate* firstDayDate = [cal dateFromComponents:comps];
    NSDate* lastDayDate = [cal dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:firstDayDate options:0];
    return lastDayDate;
}

@end
