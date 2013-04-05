//
//  CSVRow.h
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSVComponent.h"

/** A row is a list of values. */
@interface CSVRow : NSObject <CSVComponent>

/**
 Initialize a row with a list of values.
 @param values The row's values.
 @return An initialized row.
 */
- (id)initWithValues:(NSArray *)values;

/** Values in a row. */
@property (readonly) NSArray *values;

@end
