//
//  CSVTable.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "CSVTable.h"
#import "CSVVisitor.h"

@interface CSVTable ()
@property (strong, nonatomic) NSArray *rows;
@end

@implementation CSVTable

- (id)initWithRows:(NSArray *)rows
{
    if (self = [self init]) {
        [self setRows:rows];
    }
    return self;
}

- (void)accept:(id<CSVVisitor>)visitor
{
    [[self rows] makeObjectsPerformSelector:@selector(accept:) withObject:visitor];
}

@end
