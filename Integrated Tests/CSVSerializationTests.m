//
//  CSVSerializationTests.m
//  Integrated Tests
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "CSV.h"

@interface CSVSerializationTests : SenTestCase

@end

@implementation CSVSerializationTests

- (void)testSerializingRow
{
    CSVRow *ryan = [[CSVRow alloc] initWithValues:@[@"Ryan Davies", @20, @"England"]];
    
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    [serializer serialize:ryan];
    
    NSString *expectedOutput = @"Ryan Davies,20,England\n";
    STAssertEqualObjects(output, expectedOutput, @"Actual output did not match expected output.");
}

- (void)testSerializingTableWithHeaderAndOneRow
{
    CSVRow *header = [[CSVRow alloc] initWithValues:@[@"Name", @"Age", @"Country"]];
    CSVRow *ryan = [[CSVRow alloc] initWithValues:@[@"Ryan Davies", @20, @"England"]];
    CSVTable *table = [[CSVTable alloc] initWithRows:@[header, ryan]];
    
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    [serializer serialize:table];
    
    NSString *expectedOutput = @"Name,Age,Country\nRyan Davies,20,England\n";
    STAssertEqualObjects(output, expectedOutput, @"Actual output did not match expected output.");
}

- (void)testSerializingTableWithHeaderAndTwoRows
{
    CSVRow *header = [[CSVRow alloc] initWithValues:@[@"Name", @"Age", @"Country"]];
    CSVRow *ryan = [[CSVRow alloc] initWithValues:@[@"Ryan Davies", @20, @"England"]];
    CSVRow *john = [[CSVRow alloc] initWithValues:@[@"John Smith", @34, @"France"]];
    CSVTable *table = [[CSVTable alloc] initWithRows:@[header, ryan, john]];
    
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    [serializer serialize:table];
    
    NSString *expectedOutput = @"Name,Age,Country\nRyan Davies,20,England\nJohn Smith,34,France\n";
    STAssertEqualObjects(output, expectedOutput, @"Actual output did not match expected output.");
}

@end
