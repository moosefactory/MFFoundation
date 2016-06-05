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

#import <MFFoundation/NSDate+MFExtras.h>

@implementation NSDate (MFExtras)

-(NSDate*)dateByClearingTime
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitYear+NSCalendarUnitMonth+NSCalendarUnitQuarter+NSCalendarUnitWeekday+NSCalendarUnitWeekdayOrdinal+NSCalendarUnitYearForWeekOfYear+NSCalendarUnitTimeZone+NSCalendarUnitEra fromDate:self];
    return [cal dateFromComponents:comps];
}

-(NSDate*)dateBySettingHour:(NSUInteger)hour minute:(NSUInteger)minute
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitYear+NSCalendarUnitMonth+NSCalendarUnitQuarter+NSCalendarUnitWeekday+NSCalendarUnitWeekdayOrdinal+NSCalendarUnitYearForWeekOfYear+NSCalendarUnitTimeZone+NSCalendarUnitEra fromDate:self];
    comps.hour = hour%24;
    comps.minute = minute%60;
    return [cal dateFromComponents:comps];
}

-(BOOL)isSameDayAsDate:(NSDate*)date
{
    if (date==NULL) {
        NSLog(@"Date is NULL...");
        return false;
    }
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* selfcomps = [cal components:NSCalendarUnitDay+NSCalendarUnitYear+NSCalendarUnitMonth fromDate:self];
    NSDateComponents* datecomps = [cal components:NSCalendarUnitDay+NSCalendarUnitYear+NSCalendarUnitMonth fromDate:date];
    return (selfcomps.year==datecomps.year) && (selfcomps.month==datecomps.month) && (selfcomps.day==datecomps.day);
}

-(BOOL)isSameMonthAsDate:(NSDate*)date
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* selfcomps = [cal components:NSCalendarUnitYear+NSCalendarUnitMonth fromDate:self];
    NSDateComponents* datecomps = [cal components:NSCalendarUnitYear+NSCalendarUnitMonth fromDate:date];
    return (selfcomps.year==datecomps.year) && (selfcomps.month==datecomps.month);
}

-(NSDate*)oneMonthLater
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    return [cal dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:self options:0];
}

-(NSDate*)oneMonthEarlier
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    return [cal dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:self options:0];
}

-(NSDate*)oneDayEarlier
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    return [cal dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:self options:0];
}

-(NSDate*)oneDayLater
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    return [cal dateByAddingUnit:NSCalendarUnitDay value:1 toDate:self options:0];
}


-(NSUInteger)secondsSinceStartOfDay
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitHour+NSCalendarUnitMinute+NSCalendarUnitSecond fromDate:self];
    return ( comps.hour * 60 + comps.minute ) * 60 + comps.second;
}

-(NSDateComponents*)components
{
    return [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitYear+NSCalendarUnitMonth+NSCalendarUnitDay+NSCalendarUnitHour+NSCalendarUnitMinute+NSCalendarUnitSecond+NSCalendarUnitTimeZone+NSCalendarUnitWeekday+NSCalendarUnitWeekdayOrdinal fromDate:self];
}

@end
