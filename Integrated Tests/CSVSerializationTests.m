// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <SenTestingKit/SenTestingKit.h>
#import "CSV.h"

@interface CSVSerializationTests : SenTestCase

@end

@implementation CSVSerializationTests

- (void)testSerializingRowWithNumber
{
    CSVRow *ryan = [[CSVRow alloc] initWithValues:@[@"Ryan Davies", @20, @"England"]];
    
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    [serializer serialize:ryan];
    
    NSString *expectedOutput = @"Ryan Davies,20,England\n";
    STAssertEqualObjects(output, expectedOutput, @"Actual output did not match expected output.");
}

- (void)testSerializingRowWithDate
{
    CSVRow *ryan = [[CSVRow alloc] initWithValues:@[@"Ryan Davies", @20, @"England", [NSDate dateWithTimeIntervalSince1970:0]]];
    
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    [serializer serialize:ryan];
    
    NSString *expectedOutput = @"Ryan Davies,20,England,1970-01-01 00:00:00 +0000\n";
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
