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
#import <OCMock/OCMock.h>
#import "CSV.h"

@interface CSVSerializerTests : SenTestCase

@end

@implementation CSVSerializerTests

- (void)testSerializeTellsComponentToAcceptSerializer
{
    // given
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:nil];
    id component = [OCMockObject mockForProtocol:@protocol(CSVComponent)];
    [[component expect] accept:serializer];
    
    // when
    [serializer serialize:component];
    
    // then
    [component verify];
}

- (void)testWhenVisitingRowAddsCommaSeparatedValuesFollowedByNewlineToOutput
{
    // given
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    NSArray *values = @[@"A", @[], @100];
    id row = [OCMockObject mockForClass:[CSVRow class]];
    [[[row stub] andReturn:values] values];
    
    // when
    [serializer visitRow:row];
    
    // then
    STAssertEqualObjects(output, @"A,(\n),100\n", @"");
}

@end
