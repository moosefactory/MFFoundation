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

#import <CoreLocation/CoreLocation.h>
#import "MFLatLongFormatter.h"

static NSArray* cardinals;

@implementation MFLatLongFormatter

@synthesize format;

+(void)initialize
{
    if (!cardinals) {
        NSString* cardinalsString = [self cardinalsString];
        cardinals = [cardinalsString componentsSeparatedByString:@"-"];
    }
}

+(NSString*)cardinalsString
{
    return @"N-NE-E-SE-S-SW-W-NW";
}

- (NSString *)stringForObjectValue:(id)anObject {
    
    if (anObject==NULL) return @"No Location";
    
    if (![anObject isKindOfClass:[CLLocation class]]) {
        return @"Not a Location";
    }
    
    static NSNumberFormatter *numberFormatter = nil;
    if (numberFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    }
    [numberFormatter setMaximumFractionDigits:4];
    
    CLLocation *loc = (CLLocation*)anObject;
    
    NSString *string = NULL;
    
    NSString* longComponent = NULL;
    NSString* latComponent = NULL;
    NSString* degString = (format & LatLongFormatter_ShowDegree) ? @"°" : @"";
    double longitude = loc.coordinate.longitude;
    double latitude = loc.coordinate.latitude;
    if (format & LatLongFormatter_Positive) {
        if (longitude<0) longitude+=360.0f;
        if (latitude<0) latitude+=360.0f;
    }
    if (format & LatLongFormatter_DMS) {
        longComponent = [MFLatLongFormatter degreeToLatitude:loc.coordinate.latitude],
        latComponent = [MFLatLongFormatter degreeToLongitude:loc.coordinate.longitude];
    } else
        if (format & LatLongFormatter_EW) {
            NSString* cardinalString;
            if (longitude<0) {
                cardinalString = cardinals[6];
                longitude = -longitude;
            } else {
                cardinalString = cardinals[2];
            }
            longComponent = [NSString stringWithFormat:@"%@%@%@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:longitude]],degString,cardinalString];
            
            if (latitude<0) {
                cardinalString = cardinals[4];
                latitude = -latitude;
            } else {
                cardinalString = cardinals[0];
            }
            latComponent = [NSString stringWithFormat:@"%@%@%@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:latitude]],degString,cardinalString];
        } else {
            longComponent = [NSString stringWithFormat:@"%@%@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:longitude]],degString];
            latComponent = [NSString stringWithFormat:@"%@%@", [numberFormatter stringFromNumber:[NSNumber numberWithDouble:latitude]],degString];
        }
    
    switch (format) {
        case LatLongFormatter_CommaSeparated:
            string =[NSString stringWithFormat:@"%@, %@",longComponent,latComponent];
            break;
            
        case LatLongFormatter_Parameters:
            [numberFormatter setMaximumFractionDigits:10];
            string =[NSString stringWithFormat:@"lat=%@&long=%@",longComponent,latComponent];
            break;
            
        default:
            string =[NSString stringWithFormat:@"%@ %@",longComponent,latComponent];
            break;
    }
    
    return string;
    
}

+(NSString*)degreeToLatitude:(double)degFloat
{
    NSString *dms = [MFLatLongFormatter deg_to_dms:fabs(degFloat)];
    
    return [NSString stringWithFormat:@"%@%@",dms,
            (degFloat < 0) ? cardinals[4] : cardinals[0]];
    
}

+(NSString*)degreeToLongitude:(double)degFloat
{
    NSString *dms = [MFLatLongFormatter deg_to_dms:fabs(degFloat)];
    
    return [NSString stringWithFormat:@"%@%@",dms,
            (degFloat < 0) ? cardinals[6] : cardinals[2]];
    
}

+(NSString*)deg_to_dms:(double)degfloat
{
    if (degfloat < 0) return nil;
    
    double deg = floor( degfloat );
    double minfloat = 60 * ( degfloat - deg );
    double min = floor ( minfloat );
    double secfloat = 60 * ( minfloat - min );
    
    secfloat = round( secfloat );
    
    if (secfloat == 60) {
        min = min + 1;
        secfloat = 0;
    }
    
    if (min == 60) {
        deg = deg + 1;
        min = 0;
    }
    
    return [NSString stringWithFormat:@"%0.0f°%0.0f\"%0.0f'", deg, min, secfloat ];
}

@end
