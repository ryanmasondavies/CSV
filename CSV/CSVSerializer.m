//
//  CSVSerializer.m
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "CSVSerializer.h"
#import "CSVRow.h"

@interface CSVSerializer ()
@property (strong, nonatomic) NSMutableString *output;
@end

@implementation CSVSerializer

- (id)initWithOutput:(NSMutableString *)output
{
    if (self = [self init]) {
        [self setOutput:output];
    }
    return self;
}

- (void)serialize:(id<CSVComponent>)component
{
    [component accept:self];
}

- (void)visitRow:(CSVRow *)row
{
    NSString *commaSeparatedValues = [[row values] componentsJoinedByString:@","];
    [[self output] appendString:commaSeparatedValues];
    [[self output] appendString:@"\n"];
}

@end
