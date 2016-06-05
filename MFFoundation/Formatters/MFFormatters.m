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

#import <MFFoundation/MFFormatters.h>

static MFMoneyFormatter* sDefaultMoneyFormatter;
static MFDateFormatter* sDefaultDateFormatter;
static MFTimesFormatter* sDefaultTimesFormatter;

@implementation MFMoneyFormatter

+(MFMoneyFormatter*)defaultMoneyFormatter {
    if (!sDefaultMoneyFormatter) sDefaultMoneyFormatter = [[MFMoneyFormatter alloc] init];
    return sDefaultMoneyFormatter;
}

+(MFMoneyFormatter*)moneyFormatter
{
    MFMoneyFormatter* newFormatter = [[MFMoneyFormatter alloc] init];
    return newFormatter;
}

-(id)init
{
    if (self = [super init]) {
        NSLocale *locale = [NSLocale autoupdatingCurrentLocale];
        NSString* currencySymbol = [locale objectForKey:NSLocaleCurrencySymbol];
        self.numberStyle = kCFNumberFormatterCurrencyStyle;
        [self setCurrencySymbol:currencySymbol];
        [self setMinimumFractionDigits:0];
        [self setMaximumFractionDigits:2];
    }
    return self;
}

-(NSString*)stringFromFloat:(float)value
{
    return [self stringFromNumber:[NSNumber numberWithFloat:value]];
}

+(NSString*)stringFromFloat:(float)value
{
    return [[MFMoneyFormatter defaultMoneyFormatter] stringFromNumber:[NSNumber numberWithFloat:value]];
}

+(NSString*)stringFromNumber:(NSNumber*)value
{
    return [[MFMoneyFormatter defaultMoneyFormatter] stringFromNumber:value];
}

@end


@implementation MFDateFormatter

+(MFDateFormatter*)defaultDateFormatter {
    if (!sDefaultDateFormatter) sDefaultDateFormatter = [[MFDateFormatter alloc] init];
    return sDefaultDateFormatter;
}

+(MFDateFormatter*)dateFormatter
{
    MFDateFormatter* newFormatter = [[MFDateFormatter alloc] init];
    return newFormatter;
}

-(id)init
{
    if (self = [super init]) {
    }
    return self;
}

-(NSString*)stringFromDate:(NSDate*)date
{
    return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
}

+(NSString*)stringFromDate:(NSDate*)date
{
    return [[MFDateFormatter defaultDateFormatter] stringFromDate:date];
}

@end

@implementation MFTimesFormatter : NSFormatter

+(MFTimesFormatter*)defaultTimesFormatter {
    if (!sDefaultTimesFormatter) sDefaultTimesFormatter = [[MFTimesFormatter alloc] init];
    return sDefaultTimesFormatter;
}

+(MFTimesFormatter*)timesFormatter
{
    MFTimesFormatter* newFormatter = [[MFTimesFormatter alloc] init];
    return newFormatter;
}

-(id)init
{
    if (self = [super init]) {
        self.singular = @"Time";
        self.plural = @"Times";
        self.none = @"None";
    }
    return self;
}

-(NSString*)stringFromInteger:(NSInteger)value;
{
    if (value==0) return self.none;
    return [NSString stringWithFormat:@"%li %@",(long)value,(value>1 ? self.plural : self.singular)];
}

+(NSString*)stringFromInteger:(NSInteger)value;
{
    return [[MFTimesFormatter defaultTimesFormatter] stringFromInteger:value];
}

@end
