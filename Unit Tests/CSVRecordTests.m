//
//  CSVRecordTests.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>
#import "CSV.h"

@interface CSVRecordTests : SenTestCase

@end

@implementation CSVRecordTests

- (void)testTellsVisitorsToVisitRecord
{
    // given
    CSVRecord *record = [[CSVRecord alloc] init];
    id visitor = [OCMockObject mockForProtocol:@protocol(CSVVisitor)];
    [[visitor expect] visitRecord:record];
    
    // when
    [record accept:visitor];
    
    // then
    [visitor verify];
}

@end
