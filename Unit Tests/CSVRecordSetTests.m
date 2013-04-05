//
//  CSVRecordSetTests.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>
#import "CSV.h"
#import "CSVVisitor.h"

@interface CSVRecordSetTests : SenTestCase
@end

@implementation CSVRecordSetTests

- (void)testForwardsVisitorsToEachRecord
{
    // given
    NSMutableArray *records = [[NSMutableArray alloc] init];
    id visitor = [OCMockObject mockForProtocol:@protocol(CSVVisitor)];
    CSVRecordSet *recordSet = [[CSVRecordSet alloc] initWithRecords:records];
    for (NSUInteger i = 0; i < 3; i ++) {
        records[i] = [OCMockObject mockForClass:[CSVRecord class]];
        [[records[i] expect] accept:visitor];
    }
    
    // when
    [recordSet accept:visitor];
    
    // then
    [records makeObjectsPerformSelector:@selector(verify)];
}

@end
