//
//  CSVRecord.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "CSVRecord.h"
#import "CSVVisitor.h"

@implementation CSVRecord

- (void)accept:(id<CSVVisitor>)visitor
{
    [visitor visitRecord:self];
}

@end
