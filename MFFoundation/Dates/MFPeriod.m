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

#import <MFFoundation/MFPeriod.h>


@implementation MFPeriod

+(id)periodWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    MFPeriod* period = [[MFPeriod alloc] initWithStartDate:startDate endDate:endDate];
    return period;
}

-(id)initWithStartDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    if (self = [super init]) {
        self.dateRange = [MFDateRange dateRangeWithStartDate:startDate endDate:endDate];
        self.periodicity = 0;
    }
    return self;
}

-(id)init
{
    if (self = [super init]) {
        self.dateRange = [[MFDateRange alloc] init];
    }
    return self;
}

+(id)periodWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute
{
    MFPeriod* period = [[MFPeriod alloc] initWithDayDate:dayDate startHour:startHour startMinute:startMinute endHour:endHour endMinute:endMinute];
    return period;
}

-(id)initWithDayDate:(NSDate*)dayDate startHour:(NSUInteger)startHour startMinute:(NSUInteger)startMinute endHour:(NSUInteger)endHour endMinute:(NSUInteger)endMinute
{
    if (self = [super init]) {
        self.dateRange = [MFDateRange dateRangeWithDayDate:dayDate startHour:startHour startMinute:startMinute endHour:endHour endMinute:endMinute];
        self.periodicity = 0;
    }
    return self;
}

-(id)copy
{
    MFPeriod* newPeriod = [MFPeriod periodWithStartDate:self.dateRange.startDate endDate:self.dateRange.endDate];
    newPeriod.periodicity = self.periodicity;
    return newPeriod;
}

-(BOOL)containsDate:(NSDate*)date master:(BOOL*)master
{
    if (date) {
        NSCalendar* cal = [NSCalendar autoupdatingCurrentCalendar];
        NSDateComponents* comps = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear+NSCalendarUnitHour+NSCalendarUnitMinute fromDate:date];
        NSDateComponents* sc = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear+NSCalendarUnitHour+NSCalendarUnitMinute fromDate:self.dateRange.startDate];
        NSDateComponents* ec = [cal components:NSCalendarUnitDay+NSCalendarUnitMonth+NSCalendarUnitYear+NSCalendarUnitHour+NSCalendarUnitMinute fromDate:self.dateRange.endDate];
        MFDateRange *range = [self.dateRange copy];

        if (sc.day>comps.day) return NO;
        NSUInteger  periodDays = ec.day-sc.day;
        NSUInteger  deltaDays = [date timeIntervalSinceDate:self.dateRange.startDate] / (24*60*60);
        NSUInteger  deltaMod7 = deltaDays % 7;
        if ([range containsDayWithComponents:comps inCalendar:cal]) {
            *master = YES;
            return YES;
        }
        *master = NO;
        if (self.periodicity==24*60*60) {
            return YES;
        }
        if (self.periodicity==7*24*60*60) {
            return deltaMod7<=periodDays;
        }
    }
    return NO;
}

@end
