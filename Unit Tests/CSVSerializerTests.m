//
//  CSVSerializerTests.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>
#import "CSV.h"

@interface CSVSerializerTests : SenTestCase

@end

@implementation CSVSerializerTests

- (void)testWhenVisitingRowAddsCommaSeparatedValuesFollowedByNewlineToOutput
{
    // given
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    
    // when
    NSArray *values = @[@"A", @"B"];
    id row = [OCMockObject mockForClass:[CSVRow class]];
    [[[row stub] andReturn:values] values];
    [serializer visitRow:row];
    
    // then
    STAssertEqualObjects(output, @"A,B\n", @"");
}

@end
