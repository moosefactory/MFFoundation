/*--------------------------------------------------------------------------*/
/*   /\/\/\__/\/\/\        MooseFactory Framework - v3.0                    */
/*   \/\/\/..\/\/\/                                                         */
/*        |  |             (c)2007-2016 Tristan Leblanc                     */
/*        (oo)             tristan@moosefactory.eu                          */
/* MooseFactory Software                                                    */
/*--------------------------------------------------------------------------*/

/*
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "NSUITypes.h"

@interface NSUIColor (Extras)

#pragma mark ---- Value Getters ----

	-(NSString*)hexValueString;
	-(NSString*)webColorString;
	-(NSNumber*)longNumber;
	-(long)longValue;


#pragma mark ---- Static Creators with Values ----

    +(NSUIColor*)colorWithHexString:(NSString*)hexValue;
	+(NSUIColor*)colorWithLongValue:(long)inValue;
	+(NSUIColor*)colorWithLongNumber:(NSNumber*)inNumber;
	//+(NSUIColor*)colorWithCGColor:(CGColorRef)color colorSpace:(CGColorSpaceRef)colorSpace;

#pragma mark ---- Comparators ----

	-(NSComparisonResult)compareByLightness:(NSUIColor*)color;
	-(NSComparisonResult)compareByHue:(NSUIColor*)color;
	-(NSComparisonResult)compareBySaturation:(NSUIColor*)color;

#pragma mark ---- Utilities -----

    -(NSUIColor*)colorWithNoAlpha;
    -(NSUIColor*)colorWithAlphaComponentMultipliedBy:(CGFloat)factor;
@end