//
//  UnitTextTutorialTests.m
//  UnitTextTutorialTests
//
//  Created by Adem on 8.03.2017.
//  Copyright © 2017 Adem. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "ModelTest.h"
@interface UnitTextTutorialTests : XCTestCase
@property (nonatomic,strong) ViewController *vc;
@property (nonatomic,strong) ModelTest *mTest;

@end

@implementation UnitTextTutorialTests

- (void)setUp {
    [super setUp];
    self.vc=[[ViewController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.mTest=[[ModelTest alloc] init];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc=nil;
    self.vc=nil;
    [super tearDown];
}

-(void)testValidEmail
{
    NSString *originalString = @"adem@hotmail.com";
    XCTAssertTrue([self.vc validEmail:originalString]);
}

- (void)testAsynchronousURLConnection {
    NSURL *URL = [NSURL URLWithString:@"https://www.google.com.tr/"];
    NSString *description = [NSString stringWithFormat:@"GET %@", URL];
    XCTestExpectation *expectation = [self expectationWithDescription:description]; // beklenti set ediliyor
   // __block int i=0;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:URL
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                  {
                                      XCTAssertNotNil(data, "data should not be nil");
                                      XCTAssertNil(error, "error should be nil");
                                     // i=1;
                                      if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                          XCTAssertEqual(httpResponse.statusCode, 200, @"HTTP response status code should be 200");
                                          XCTAssertEqualObjects(httpResponse.URL.absoluteString, URL.absoluteString, @"HTTP response URL should be equal to original URL");
                                          XCTAssertEqualObjects(httpResponse.MIMEType, @"text/html", @"HTTP response content type should be text/html");
                                      } else {
                                          XCTFail(@"Response was not NSHTTPURLResponse");
                                      }
                                      
                                     [expectation fulfill]; // Asynchronous task için zorunlu
                                  }];
    
    [task resume];
   // XCTAssertEqual(i,1);
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);    
        }
        [task cancel];
    }];
   // XCTAssertEqual(i,1);
}

- (void)testReverseString {
    NSString *originalString = @"adem";
    NSString *reversedString = [self.vc reverseString:originalString];
    
    XCTAssertEqualObjects(originalString, reversedString, @"The reversed string did not match");
}

- (void)testExample1 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertEqual([self.vc isColorRed], [UIColor redColor]);
    
}

- (void)testExample2 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    id test=nil;
    XCTAssertNil(test);
    
}

- (void)testExample3 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    id test;
    test=[NSNumber numberWithInt:5];
    XCTAssertNotNil(test);
    
}

- (void)testExample4 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    id test;
    test=[NSNumber numberWithInt:5];
    XCTAssertTrue(test);
    
}

- (void)testExample5 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BOOL test;
    test=NO;
    XCTAssertFalse(test);
    
}

- (void)testExample6 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _mTest=[[ModelTest alloc] init];
    _mTest.strTest1=@"Ali";
    _mTest.strTest2=@"Veli";
    ModelTest *model=[self.vc vcModel];
    XCTAssertEqualObjects(_mTest.strTest1, model.strTest1);
    
    
}

- (void)testExample7 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _mTest=[[ModelTest alloc] init];
    _mTest.strTest1=@"Ali";
    _mTest.strTest2=@"Veli";
    ModelTest *model=[self.vc vcModel];
   // XCTAssertNotEqualObjects(_mTest.strTest1, model.strTest1);
    XCTAssertNotEqualObjects(_mTest.strTest1, model.strTest2);
    
}

- (void)testExample8 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _mTest=[[ModelTest alloc] init];
    _mTest.strTest1=@"Ali";
    _mTest.strTest2=@"Veli";
    ModelTest *model=[self.vc vcModel];
    XCTAssertEqualObjects(_mTest.strTest1, model.strTest1); // AssertEqualObjects ile AssertEqual farkı
    XCTAssertEqual(_mTest.strTest1, model.strTest1);
    
}

- (void)testExample9 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _mTest=[[ModelTest alloc] init];
    _mTest.strTest1=@"Ali";
    _mTest.strTest2=@"Veli";
    ModelTest *model=[self.vc vcModel];
    // XCTAssertNotEqualObjects(_mTest.strTest1, model.strTest1);
    XCTAssertNotEqual(_mTest.strTest1, model.strTest2);
    
}

/*
- (void)testExample10 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _mTest=[[ModelTest alloc] init];
    _mTest.dTest1=1.1;
    ModelTest *model=[self.vc vcModelDouble];
    // XCTAssertNotEqualObjects(_mTest.strTest1, model.strTest1);
    XCTAssertEqualWithAccuracy(_mTest.dTest1, model.dTest1,0.011); //aralarında olabilecek maximum fark, doğruluk payı
    
}

- (void)testExample11 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _mTest=[[ModelTest alloc] init];
    _mTest.dTest1=1.111;
    ModelTest *model=[self.vc vcModelDouble];
    // XCTAssertNotEqualObjects(_mTest.strTest1, model.strTest1);
    XCTAssertNotEqualWithAccuracy(_mTest.dTest1, model.dTest1,0.0);
}

- (void)testExample12 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _mTest=[[ModelTest alloc] init];
    _mTest.dTest1=2.11;
    ModelTest *model=[self.vc vcModelDouble];
    XCTAssertGreaterThan(_mTest.dTest1, model.dTest1);
}
*/



- (void)testPerformancExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        NSString *originalString = @"adem@hotmail.com";
        XCTAssertTrue([self.vc validEmail:originalString]);
    }];
}

@end
