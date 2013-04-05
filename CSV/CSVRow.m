//
//  CSVRow.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "CSVRow.h"
#import "CSVVisitor.h"

@interface CSVRow ()
@property (strong, nonatomic) NSArray *values;
@end

@implementation CSVRow

- (id)initWithValues:(NSArray *)values
{
    if (self = [self init]) {
        [self setValues:values];
    }
    return self;
}

- (void)accept:(id<CSVVisitor>)visitor
{
    [visitor visitRow:self];
}

@end
