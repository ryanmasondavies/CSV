//
//  CSVRecordSet.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "CSVRecordSet.h"

@interface CSVRecordSet ()
@property (strong, nonatomic) NSArray *records;
@end

@implementation CSVRecordSet

- (id)initWithRecords:(NSArray *)records
{
    if (self = [self init]) {
        [self setRecords:records];
    }
    return self;
}

@end
