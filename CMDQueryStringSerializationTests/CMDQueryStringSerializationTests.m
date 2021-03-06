//
//  CMDQueryStringSerializationTests.m
//  CMDQueryStringSerializationTests
//
//  Created by Caleb Davenport on 1/21/14.
//  Copyright (c) 2014 Caleb Davenport. All rights reserved.
//

@import XCTest;

#import "CMDQueryStringSerialization.h"

@interface CMDQueryStringSerializationTests : XCTestCase

@end

@implementation CMDQueryStringSerializationTests

- (void)testOneKeyValuePair {
    NSString *desiredString = @"key=value";
    NSDictionary *desiredDictionary = @{ @"key" : @"value" };
    
    NSString *actualString = [CMDQueryStringSerialization queryStringWithDictionary:desiredDictionary];
    XCTAssertEqualObjects(actualString, desiredString, @"Query string is incorrect.");
    
    NSDictionary *actualDictionary = [CMDQueryStringSerialization dictionaryWithQueryString:desiredString];
    XCTAssertEqualObjects(actualDictionary, desiredDictionary, @"Query parameters are incorrect.");
}


- (void)testTwoKeyValuePairs {
    NSString *desiredString = @"key_one=value_one&key_two=value_two";
    NSDictionary *desiredDictionary = @{
        @"key_one" : @"value_one",
        @"key_two" : @"value_two"
    };
    
    NSString *actualString = [CMDQueryStringSerialization queryStringWithDictionary:desiredDictionary];
    XCTAssertEqualObjects(actualString, desiredString, @"Query string is incorrect.");
    
    NSDictionary *actualDictionary = [CMDQueryStringSerialization dictionaryWithQueryString:desiredString];
    XCTAssertEqualObjects(actualDictionary, desiredDictionary, @"Query parameters are incorrect.");
}


- (void)testQueryStringWithRepeatingParameterNoBrackets {
    NSString *desiredString = @"key=one&key=two";
    NSDictionary *desiredDictionary = @{
        @"key" : @[ @"one", @"two" ]
    };
    
    NSString *actualString = [CMDQueryStringSerialization queryStringWithDictionary:desiredDictionary];
    XCTAssertEqualObjects(actualString, desiredString, @"Query string is incorrect.");
    
    NSDictionary *actualDictionary = [CMDQueryStringSerialization dictionaryWithQueryString:desiredString];
    XCTAssertEqualObjects(actualDictionary, desiredDictionary, @"Query parameters are incorrect.");
}


- (void)testQueryStringWithRepeatingParameterWithBracketsToDictionary {
    NSString *desiredString = @"key[]=one&key[]=two";
    NSDictionary *desiredDictionary = @{
        @"key" : @[ @"one", @"two" ]
    };
    
    NSString *actualString = [CMDQueryStringSerialization queryStringWithDictionary:desiredDictionary arrayOption:CMDQueryStringArraySerializationOptionMultipleBracketedKeys];
    XCTAssertEqualObjects(actualString, desiredString, @"Query string is incorrect.");
    
    NSDictionary *actualDictionary = [CMDQueryStringSerialization dictionaryWithQueryString:desiredString arrayOption:CMDQueryStringArraySerializationOptionMultipleBracketedKeys];
    XCTAssertEqualObjects(actualDictionary, desiredDictionary, @"Query parameters are incorrect.");
}

- (void)testQueryStringWithCommaDelimitedValue {
    NSString *desiredString = @"key=one,two";
    NSDictionary *desiredDictionary = @{
        @"key" : @[ @"one", @"two" ]
    };
    
    NSString *actualString = [CMDQueryStringSerialization queryStringWithDictionary:desiredDictionary arrayOption:CMDQueryStringArraySerializationOptionCommaSeparated];
    XCTAssertEqualObjects(actualString, desiredString, @"Query string is incorrect.");
    
    NSDictionary *actualDictionary = [CMDQueryStringSerialization dictionaryWithQueryString:desiredString arrayOption:CMDQueryStringArraySerializationOptionCommaSeparated];
    XCTAssertEqualObjects(actualDictionary, desiredDictionary, @"Query parameters are incorrect.");
}

- (void)testQueryStringWithCommaDelimitedValueButMultipleKeyArraySerializationType {
    NSString *desiredString = @"key=one,two";
    NSDictionary *desiredDictionary = @{
        @"key" : @[ @"one,two" ]
    };
    
    NSString *actualString = [CMDQueryStringSerialization queryStringWithDictionary:desiredDictionary];
    XCTAssertEqualObjects(actualString, desiredString, @"Query string is incorrect.");
    
    NSDictionary *actualDictionary = [CMDQueryStringSerialization dictionaryWithQueryString:desiredString];
    XCTAssertEqualObjects(actualDictionary, desiredDictionary, @"Query parameters are incorrect.");
}

@end
