//
//  MFFoundation_Tests.m
//  MFFoundation Tests
//
//  Created by Tristan Leblanc on 12/03/16.
//  Copyright © 2016 MooseFactory. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <MFFoundation/MFFoundation.h>


@interface MFFoundation_Tests : XCTestCase

@end

@implementation MFFoundation_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testMFSystem
{
    NSString* logStr = @"\r\r------------------ MFSystem Will Pass Test------------------\r";
    logStr = [logStr stringByAppendingString:@"\r\rHardware :"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem machine] = %@",[MFSystem machine]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem model] = %@",[MFSystem model]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem cpu] = %@",[MFSystem cpu]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem byteorder] = %ldl",(long)[MFSystem byteorder]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem architecture] = %@",[MFSystem architecture]];
    logStr = [logStr stringByAppendingString:@"\r\rKernel :"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem kernelVersion] = %@",[MFSystem kernelVersion]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem kernelRelease] = %@",[MFSystem kernelRelease]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem kernelRevision] = %@",[MFSystem kernelRevision]];
    logStr = [logStr stringByAppendingString:@"\r\rSystem :"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersion] = %@",[MFSystem systemVersion]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionFloat] = %f",[MFSystem systemVersionFloat]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPatch] = %@",[MFSystem systemVersionPatch]];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPatchFloat] = %f",[MFSystem systemVersionPatchFloat]];
    logStr = [logStr stringByAppendingString:@"\r\rTest :"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorTo:@\"8.0\"] = %@",[MFSystem systemVersionPriorTo:@"8.0"] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorOrEqualTo:@\"8.0\"] = %@",[MFSystem systemVersionPriorOrEqualTo:@"8.0"] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorTo:@\"8.5\"] = %@",[MFSystem systemVersionPriorTo:@"8.5"] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorOrEqualTo:@\"8.5\"] = %@",[MFSystem systemVersionPriorOrEqualTo:@"8.5"] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorTo:@\"9.0\"] = %@",[MFSystem systemVersionPriorTo:@"9.0"] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorOrEqualTo:@\"9.0\"] = %@",[MFSystem systemVersionPriorOrEqualTo:@"9.0"] ? @"YES" : @"NO"];
    
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorTo:@\"20.0\"] = %@   ( Big Enough ??? ;)",[MFSystem systemVersionPriorTo:@"20.0"] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorOrEqualTo:@\"20.0\"] = %@",[MFSystem systemVersionPriorOrEqualTo:@"20.0"] ? @"YES" : @"NO"];

    NSString* version = [MFSystem systemVersion];
    
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorTo:@\"%@\"] = %@",version,[MFSystem systemVersionPriorTo:@"9.0"] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r[MFSystem systemVersionPriorOrEqualTo:@\"%@\"] = %@",version,[MFSystem systemVersionPriorOrEqualTo:version] ? @"YES" : @"NO"];

    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ MFSystem Test Passed ------------------\r\r"];
    
    NSLog(@"%@",logStr);
}

/*
-(void)testMFSecuriy
{
    SecCertificateRef myAppleRootCA = AppleRootCA();
    
    NSString* logStr = @"\r\r------------------ MFSecurity Will Pass Test------------------\r";
    
    logStr = [logStr stringByAppendingString:@"\r\rHardware :"];
    CFDataRef macad = copy_mac_address();
    NSData* macadData = ((__bridge NSData*)macad);
    NSString* macadstr = macadData ? [NSString stringWithCString:macadData.bytes encoding:NSUTF8StringEncoding] : @"";
    logStr = [logStr stringByAppendingFormat:@"\rcopy_mac_address() : %@",macadstr];
    logStr = [logStr stringByAppendingFormat:@"\rAppleRootCA() : %@",myAppleRootCA ? @"OK" : @"NOT FOUND"];
    logStr = [logStr stringByAppendingFormat:@"\rcheck_code_signature() : %@",check_code_signature() ? @"SIGNED" : @"UNSIGNED"];

    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ MFSystem Test Passed ------------------\r\r"];
    
    NSLog(@"%@",logStr);
}
*/

-(void)testMFMaths
{
    NSString* logStr = @"\r\r------------------ MFMaths Will Pass Test------------------\r";
    
    logStr = [logStr stringByAppendingString:@"\rMaths :"];
    
    extern  const float kPiOnThree;
    extern  const float kTwoPiOnThree;
    
    logStr = [logStr stringByAppendingFormat:@"\rkPiOnThree = %f",kPiOnThree];
    logStr = [logStr stringByAppendingFormat:@"\rkTwoPiOnThree = %f",kTwoPiOnThree];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rMF_clampOne(0.6f) = %f",MF_clampOne(0.6f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_clampOne(1.8f) = %f",MF_clampOne(1.8f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_clampOne(-0.6f) = %f",MF_clampOne(-0.6f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_clampOne(-1.8f) = %f",MF_clampOne(-1.8f)];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rMF_clampAngle(2.0f) = %f",MF_clampAngle(2.0f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_clampAngle(3.8f) = %f",MF_clampAngle(3.8f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_clampAngle(-2.0f) = %f",MF_clampAngle(-2.0f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_clampAngle(-3.8f) = %f",MF_clampAngle(-3.8f)];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rMF_modf(3.5f,1.4f) = %f",MF_modf(3.5f,1.4f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_modf(3.5f,2.9f) = %f",MF_modf(3.5f,2.9f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_modf(3.5f,4.0f) = %f",MF_modf(3.5f,4.0f)];
    
    logStr = [logStr stringByAppendingFormat:@"\rMF_modf(-3.5f,-1.4f) = %f",MF_modf(-3.5f,-1.4f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_modf(-3.5f,-2.9f) = %f",MF_modf(-3.5f,-2.9f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_modf(-3.5f,-4.0f) = %f",MF_modf(-3.5f,-4.0f)];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rmfpsin(0.0f) = %f",mfpsin(0.0f)];
    logStr = [logStr stringByAppendingFormat:@"\rmfpsin(M_PI / 2) = %f",mfpsin(M_PI / 2)];
    logStr = [logStr stringByAppendingFormat:@"\rmfpsin(M_PI) = %f",mfpsin(M_PI)];
    logStr = [logStr stringByAppendingFormat:@"\rmfpsin(M_PI*1.5) = %f",mfpsin(M_PI*1.5)];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rmfpcos(0.0f) = %f",mfpcos(0.0f)];
    logStr = [logStr stringByAppendingFormat:@"\rmfpcos(M_PI / 2) = %f",mfpcos(M_PI / 2)];
    logStr = [logStr stringByAppendingFormat:@"\rmfpcos(M_PI) = %f",mfpcos(M_PI)];
    logStr = [logStr stringByAppendingFormat:@"\rmfpcos(M_PI*1.5) = %f",mfpcos(M_PI*1.5)];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rMF_maxf(-3.5f,-1.4f) = %f",MF_maxf(3.5f,1.4f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_maxf(-3.5f,-2.9f) = %f",MF_maxf(3.5f,-2.9f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_maxf(-3.5f,-4.0f) = %f",MF_maxf(0.0f,2.0f)];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rMF_minf(-3.5f,-1.4f) = %f",MF_maxf(3.5f,1.4f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_minf(-3.5f,-2.9f) = %f",MF_maxf(3.5f,-2.9f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_minf(-3.5f,-4.0f) = %f",MF_maxf(0.0f,2.0f)];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rMF_max3f(-3.5f,-1.4f,8.0f) = %f",MF_max3f(-3.5f,-1.4f,8.0f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_max3f(-3.5f,2.9f,-1.0f) = %f",MF_max3f(-3.5f,2.9f,-1.0f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_max3f(13.5f,4.0f,1.0f) = %f",MF_max3f(13.5f,4.0f,1.0f)];
    
    logStr = [logStr stringByAppendingFormat:@"\r\rMF_min3f(-3.5f,-1.4f,8.0f) = %f",MF_min3f(-3.5f,-1.4f,8.0f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_min3f(-3.5f,2.9f,-1.0f) = %f",MF_min3f(-3.5f,2.9f,-1.0f)];
    logStr = [logStr stringByAppendingFormat:@"\rMF_min3f(13.5f,4.0f,1.0f) = %f",MF_min3f(13.5f,4.0f,1.0f)];
    
    CGFloat a,b;
    MF_cartesianToPolar(4,3,&a,&b);
    logStr = [logStr stringByAppendingFormat:@"\r\rMF_cartesianToPolar(4,3) : teta=%f, phi=%f",a,b];
    MF_cartesianToPolar(-4,3,&a,&b);
    logStr = [logStr stringByAppendingFormat:@"\rMF_cartesianToPolar(-4,3) : teta=%f, phi=%f",a,b];
    MF_cartesianToPolar(-4,-3,&a,&b);
    logStr = [logStr stringByAppendingFormat:@"\rMF_cartesianToPolar(-4,-3) : teta=%f, phi=%f",a,b];
    MF_cartesianToPolar(4,-3,&a,&b);
    logStr = [logStr stringByAppendingFormat:@"\rMF_cartesianToPolar(4,-3) : teta=%f, phi=%f",a,b];
    
    //    void MF_polarToCartesian(float teta,float phi,float *x, float *y);
    
    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ MFMath Test Passed ------------------\r\r"];
    
    NSLog(@"%@",logStr);
    
}

/*  Duplicate
 
-(void)testLog
{
    NSString* logStr = @"\r\r------------------ MFLog Will Pass Test------------------\r";
    
    logStr = [logStr stringByAppendingString:@"\Section :"];
    
    logStr = [logStr stringByAppendingFormat:@"\r Item"];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ MFLog Test Passed ------------------\r\r"];
    
    NSLog(@"%@",logStr);
    
}

 */

-(void)testMFStringExtras
{
    NSString* logStr = @"\r\r------------------ NSData+MFExtras ------------------\r";
    
    logStr = [logStr stringByAppendingString:@"\rCrypting :"];
    
    
    logStr = [logStr stringByAppendingFormat:@"\r\r [@\"MooseFactory\" md5] = %@",[@"MooseFactory" md5]];
    logStr = [logStr stringByAppendingFormat:@"\r [@\"MooseFactory\" sha1] = %@",[@"MooseFactory" sha1]];
    
    logStr = [logStr stringByAppendingString:@"\rValidation :"];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r [@\"MooseFactory\" isValidEmail:YES] = %@",[@"MooseFactory" isValidEmail:YES] ? @"VALID" : @"NOT VALID"];
    logStr = [logStr stringByAppendingFormat:@"\r [@\"moose@moosefactory\" isValidEmail:YES] = %@",[@"moose@moosefactory" isValidEmail:YES] ? @"VALID" : @"NOT VALID"];
    logStr = [logStr stringByAppendingFormat:@"\r [@\"moose@moosefactory.eu\" isValidEmail:YES] = %@",[@"moose@moosefactory.eu" isValidEmail:YES] ? @"VALID" : @"NOT VALID"];
    logStr = [logStr stringByAppendingFormat:@"\r [@\"moo+se@moosefactory.eu\" isValidEmail:YES] = %@",[@"moo+se@moosefactory.eu" isValidEmail:YES] ? @"VALID" : @"NOT VALID"];
    logStr = [logStr stringByAppendingFormat:@"\r [@\"moo+se@moosefactory.eu\" isValidEmail:NO] = %@",[@"moo+se@moosefactory.eu" isValidEmail:NO] ? @"VALID" : @"NOT VALID"];
    
    logStr = [logStr stringByAppendingString:@"\rPercent Escape :"];
    
    NSString* string = @"Let's all shout \"Moose & MooseFactory\" !";
    NSString* encodedStr = [string urlEncode];
    NSString* decodedStr = [encodedStr urlDecode];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r [@\"%@\" urlEncode] = %@",string,encodedStr];
    logStr = [logStr stringByAppendingFormat:@"\r [@\"%@\" urlDecode] = %@",encodedStr,decodedStr];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ NSData+MFExtras ------------------\r\r"];
    
    NSLog(@"%@",logStr);
    
}


-(void)testNSData_MFExtras
{
    NSString* logStr = @"\r\r------------------ NSData+MFExtras ------------------\r";
    
    logStr = [logStr stringByAppendingString:@"\Bytes :"];
    
    NSString* str = @"0102030405AA00CDEF";

    NSData* data = [NSData dataWithBytesString:str];
    
    NSString* convStr = [NSString stringWithCString:data.bytes encoding:NSUTF8StringEncoding];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r data = [NSData dataWithBytesString:@\"0102030405AA00CDEF\"] = %@",convStr];
    logStr = [logStr stringByAppendingFormat:@"\r [data bytesString] = %@",[data bytesString]];
    
    logStr = [logStr stringByAppendingString:@"\r\rRandom :"];

    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ NSData+MFExtras ------------------\r\r"];
    
    NSLog(@"%@",logStr);
    
}


-(void)testNSArray_MFExtras
{
    NSArray* testArray = @[@"Zebra",@"Cat",@"Lion",@"Dog",@"Camel"];
    
    NSArray* resultArray = [testArray arrayByRemovingFirstObject];
    
    NSString* logStr = @"\r\r------------------ NSArray+MFExtras ------------------\r";
    
    logStr = [logStr stringByAppendingFormat:@"\r\rtestArray = \r%@",[testArray description]];
    logStr = [logStr stringByAppendingString:@"\r\rAdding / Removing Objects :"];
    
    
    logStr = [logStr stringByAppendingFormat:@"\rr[testArray arrayByRemovingFirstObject] :\r%@",[testArray arrayByRemovingFirstObject]];
    logStr = [logStr stringByAppendingFormat:@"\rr[testArray arrayByRemovingLastObject] :\r%@",[testArray arrayByRemovingLastObject]];
    
    logStr = [logStr stringByAppendingString:@"\r\rSort :"];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r[testArray alphabeticallySortedArray] :\r%@",[testArray alphabeticallySortedArray]];

    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ NSArray+MFExtras ------------------\r\r"];
    
    NSLog(@"%@",logStr);
    
}

/*
 -(NSDate*)dateByClearingTime;
 -(NSDate*)dateBySettingHour:(NSUInteger)hour minute:(NSUInteger)minute;
 
 -(BOOL)isSameDayAsDate:(NSDate*)date;
 -(BOOL)isSameMonthAsDate:(NSDate*)date;
 
 -(NSDate*)oneMonthLater;
 -(NSDate*)oneMonthEarlier;
 
 -(NSDate*)oneDayEarlier;
 -(NSDate*)oneDayLater;
 
 -(NSUInteger)secondsSinceStartOfDay;
 -(NSDateComponents*)components;
*/
-(void)testNSDate_MFExtras
{
    NSDate* todayDate = [NSDate date];
    NSDate* todayDateInOneHour = [[NSDate date] dateByAddingTimeInterval:60*60];
    NSDate* tomorrowDate = [NSDate date];
    
    NSString* logStr = @"\r\r------------------ NSDate+MFExtras ------------------\r";
    
    logStr = [logStr stringByAppendingFormat:@"\r\rtodayDate = \r%@",[todayDate description]];
    logStr = [logStr stringByAppendingFormat:@"\r\rtodayDateInOneHour = \r%@",[todayDateInOneHour description]];
    logStr = [logStr stringByAppendingFormat:@"\r\rtomorrowDate = \r%@",[tomorrowDate description]];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate dateByClearingTime] :\r%@",[todayDate dateByClearingTime]];
    logStr = [logStr stringByAppendingFormat:@"\r[todayDate dateBySettingHour:8 minute:30] :\r%@",[todayDate dateBySettingHour:8 minute:30]];
    
    logStr = [logStr stringByAppendingString:@"\r\rTest Dates :"];

    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate isSameDayAsDate:tommorowDate] :\r%@",[todayDate isSameDayAsDate:tomorrowDate] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate isSameDayAsDate:todayDateInOneHour] :\r%@",[todayDate isSameDayAsDate:todayDateInOneHour] ? @"YES" : @"NO"];
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate iisSameMonthAsDateDate:tommorowDate] :\r%@",[todayDate isSameMonthAsDate:tomorrowDate] ? @"YES" : @"NO"];
    
    logStr = [logStr stringByAppendingString:@"\r\rShift Dates:"];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate oneMonthLater] :\r%@",[todayDate oneMonthLater]];
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate oneMonthEarlier] :\r%@",[todayDate oneMonthEarlier]];
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate oneDayEarlier] :\r%@",[todayDate oneDayEarlier]];
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate oneDayLater] :\r%@",[todayDate oneDayLater]];
    
    logStr = [logStr stringByAppendingString:@"\r\rSeconds:"];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate secondsSinceStartOfDay] :\r%i",[todayDate secondsSinceStartOfDay]];
    
    logStr = [logStr stringByAppendingString:@"\r\rComponents:"];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r[todayDate components] :\r%i",[todayDate components]];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ NSDate+MFExtras ------------------\r\r"];
    
    NSLog(@"%@",logStr);
    
}

-(void)testNSFileSystem_MFExtras
{
//    -(BOOL)isDirectoryEmpty:(NSString*)path containsOnlyInvisibleFiles:(BOOL*)containsOnlyInvisibleFiles;

    NSString* logStr = @"\r\r------------------ NSFileSystem_MFExtras Will Pass Test------------------\r";
    
    NSString* path = @"~/NSFileSystem_MFExtras-TestFolder";
    NSString* filesPath = [path stringByAppendingPathComponent:@"FolderWithFiles"];
    NSString* invisibleFilesPath = [path stringByAppendingPathComponent:@"FolderWithInvisibleFilesOnly"];
    NSString* emptyPath = [path stringByAppendingPathComponent:@"EmptyFolder"];
    NSString* folderWithFolderAndFilesPath = [path stringByAppendingPathComponent:@"FolderWithFolderAndFiles"];
    
    BOOL testFolderExists;
    BOOL testFolderIsFolder;
    testFolderExists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&testFolderIsFolder];
    logStr = [logStr stringByAppendingFormat:@"\r\rTest in folder : %@",path];
    logStr = [logStr stringByAppendingFormat:@"\r\r\"%@\" Exists : %@   is folder : %@",path, (testFolderExists||testFolderIsFolder) ? @"YES" : @"NO", testFolderIsFolder ? @"YES" : @"NO"];
    
    BOOL dirEmpty;
    BOOL onlyInvisible;

    dirEmpty = [[NSFileManager defaultManager] isDirectoryEmpty:filesPath containsOnlyInvisibleFiles:&onlyInvisible];
    logStr = [logStr stringByAppendingFormat:@"\r [[NSFileManager defaultManager] isDirectoryEmpty:\"%@\"] : %@ - contains only invisible : %@ ",filesPath, dirEmpty ? @"YES" : @"NO", onlyInvisible ? @"YES" : @"NO"];
    
    dirEmpty = [[NSFileManager defaultManager] isDirectoryEmpty:invisibleFilesPath containsOnlyInvisibleFiles:&onlyInvisible];
    logStr = [logStr stringByAppendingFormat:@"\r [[NSFileManager defaultManager] isDirectoryEmpty:\"%@\"] : %@ - contains only invisible : %@ ",invisibleFilesPath, dirEmpty ? @"YES" : @"NO", onlyInvisible ? @"YES" : @"NO"];
    
    dirEmpty = [[NSFileManager defaultManager] isDirectoryEmpty:emptyPath containsOnlyInvisibleFiles:&onlyInvisible];
    logStr = [logStr stringByAppendingFormat:@"\r [[NSFileManager defaultManager] isDirectoryEmpty:\"%@\"] : %@ - contains only invisible : %@ ",emptyPath, dirEmpty ? @"YES" : @"NO", onlyInvisible ? @"YES" : @"NO"];
    
    dirEmpty = [[NSFileManager defaultManager] isDirectoryEmpty:folderWithFolderAndFilesPath containsOnlyInvisibleFiles:&onlyInvisible];
    logStr = [logStr stringByAppendingFormat:@"\r [[NSFileManager defaultManager] isDirectoryEmpty:\"%@\"] : %@ - contains only invisible : %@ ",folderWithFolderAndFilesPath, dirEmpty ? @"YES" : @"NO", onlyInvisible ? @"YES" : @"NO"];
    
    logStr = [logStr stringByAppendingFormat:@"\r\r------------------ NSFileSystem_MFExtras Test Passed ------------------\r\r"];
    
    NSLog(@"%@",logStr);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{

    }];
}

@end
