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

#import <MFFoundation/MFSystem.h>

#include <errno.h>
#include <sys/sysctl.h>

static int          sysctl_err; // Sticky error after last call

static NSString*    systVersion;
static float        systVersionFloat;
static NSString*    systVersionPatch;
static float        systVersionPatchFloat;

@implementation MFSystem

+(NSString*)machine
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("hw.machine", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)model
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("hw.model", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)cpu
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("hw.cpu", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSInteger)byteorder
{
    int byteorder;
    size_t size = sizeof(byteorder);
    sysctl_err = sysctlbyname("hw.byteorder", &byteorder, &size, NULL, 0);
    return byteorder;
}

+(NSString*)architecture
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("hw.arch", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)kernelVersion
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("kern.version", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

#pragma mark - System

+(NSString*)kernelRelease
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("kern.osrelease", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)kernelRevision
{
    char str[256];
    size_t size = sizeof(str);
    sysctl_err = sysctlbyname("kern.osrev", str, &size, NULL, 0);
    return strlen(str) ?[NSString stringWithCString:str encoding:NSASCIIStringEncoding] : @"";
}

+(NSString*)systemVersionPatch
{
    NSOperatingSystemVersion opSystVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    if (!systVersionPatch) {
        systVersionPatch = [NSString stringWithFormat:@"%lu.%lu.%lu",(unsigned long)opSystVersion.majorVersion,(unsigned long)opSystVersion.minorVersion,(unsigned long)opSystVersion.patchVersion];
    }
    return systVersionPatch;
}

+(NSString*)systemVersion
{
    NSOperatingSystemVersion opSystVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    if (!systVersion) {
        systVersion = [NSString stringWithFormat:@"%lu.%lu",(unsigned long)opSystVersion.majorVersion,(unsigned long)opSystVersion.minorVersion];
    }
    return systVersion;
}

+(float)systemVersionFloat
{
    NSOperatingSystemVersion opSystVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    if (systVersionFloat==0.0f) {
        systVersionFloat = [[NSString stringWithFormat:@"%lu.%lu",(unsigned long)opSystVersion.majorVersion,(unsigned long)opSystVersion.minorVersion] floatValue];
    }
    return systVersionFloat;
}

+(float)systemVersionPatchFloat
{
    NSOperatingSystemVersion opSystVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    if (systVersionPatchFloat==0.0f) {
        systVersionPatchFloat = [[NSString stringWithFormat:@"%lu.%lu%lu",(unsigned long)opSystVersion.majorVersion,(unsigned long)opSystVersion.minorVersion,(unsigned long)opSystVersion.patchVersion] floatValue];
    }
    return systVersionPatchFloat;
}

#pragma mark -

+(BOOL)systemVersionPriorTo:(NSString*)systemVersion
{
    float testVersion = [systemVersion floatValue];
    return [MFSystem systemVersionFloat]<testVersion;
}

+(BOOL)systemVersionPriorOrEqualTo:(NSString*)systemVersion
{
    float testVersion = [systemVersion floatValue];
    return [MFSystem systemVersionFloat]<=testVersion;
}

+(BOOL)systemVersionEqualTo:(NSString*)systemVersion
{
    float testVersion = [systemVersion floatValue];
    return [MFSystem systemVersionFloat]==testVersion;
}

@end
