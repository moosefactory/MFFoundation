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

#import "MFDateRange.h"

@implementation MFDateRange

+(id)dateRangeWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    MFDateRange* dateRange = [[MFDateRange alloc] initWithStartDate:startDate endDate:endDate];
    return dateRange;
}

-(id)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    if (self = [super init]) {
        self.startDate = startDate;
        self.endDate = endDate;
    }
    return self;
}

+(id)dateRangeWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute
{
    
    MFDateRange* dateRange = [[MFDateRange alloc] initWithDayDate:dayDate startHour:startHour startMinute:startMinute endHour:endHour endMinute:endMinute];
    return dateRange;
}

-(id)initWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:dayDate];
    comps.minute = startMinute;
    comps.hour = startHour;
    NSDate* startDate = [cal dateFromComponents:comps];
    comps.hour = endHour;
    comps.minute = endMinute;
    NSDate* endDate = [cal dateFromComponents:comps];

    return [self initWithStartDate:startDate endDate:endDate];
}

-(BOOL)containsDayWithComponents:(NSDateComponents*)comps inCalendar:(NSCalendar*)cal
{
    NSDateComponents* sc = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear fromDate:self.startDate];
    NSDateComponents* ec = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear fromDate:self.endDate];
    if ( (sc.year<=comps.year) && (ec.year>=comps.year) ) {
        if ( (sc.month<=comps.month) && (ec.month>=comps.month) ) {
            if ( (sc.day<=comps.day) && (ec.day>=comps.day) ) {
                        return YES;
            }
        }
    }
    return NO;
}

-(BOOL)containsDate:(NSDate*)date
{
    NSInteger i1 = [date timeIntervalSinceDate:self.startDate];
    NSInteger i2 = [date timeIntervalSinceDate:self.endDate];
    
    return( (i1>0) && (i2<0) );
}


-(id)copy
{
    MFDateRange* newDateRange = [MFDateRange dateRangeWithStartDate:self.startDate endDate:self.endDate];
    return newDateRange;
}

-(void)startHour:(NSUInteger*)hours minutes:(NSUInteger*)minutes
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitHour+NSCalendarUnitMinute fromDate:self.startDate];
    *hours = [comps hour];
    *minutes = [comps minute];
}

-(void)endHour:(NSUInteger*)hours minutes:(NSUInteger*)minutes
{
    NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents* comps = [cal components:NSCalendarUnitHour+NSCalendarUnitMinute fromDate:self.endDate];
    *hours = [comps hour];
    *minutes = [comps minute];
}

-(NSTimeInterval)duration
{
    if (!self.startDate || !self.endDate) return INT64_MAX;
    return [self.endDate timeIntervalSinceDate:self.startDate];
}

@end
