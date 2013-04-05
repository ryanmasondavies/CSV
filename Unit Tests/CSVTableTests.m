//
//  CSVTableTests.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>
#import "CSV.h"

@interface CSVTableTests : SenTestCase
@end

@implementation CSVTableTests

- (void)testForwardsVisitorsToEachRow
{
    // given
    NSMutableArray *rows = [[NSMutableArray alloc] init];
    id visitor = [OCMockObject mockForProtocol:@protocol(CSVVisitor)];
    CSVTable *table = [[CSVTable alloc] initWithRows:rows];
    for (NSUInteger i = 0; i < 3; i ++) {
        rows[i] = [OCMockObject mockForClass:[CSVRow class]];
        [[rows[i] expect] accept:visitor];
    }
    
    // when
    [table accept:visitor];
    
    // then
    [rows makeObjectsPerformSelector:@selector(verify)];
}

@end
