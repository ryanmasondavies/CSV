//
//  CSVTable.h
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSVComponent.h"
@protocol CSVVisitor;

/** A table is made up of several rows. */
@interface CSVTable : NSObject <CSVComponent>

/**
 Initialize a table with an array of rows.
 @param rows The rows in the table.
 @return An initialized table.
 */
- (id)initWithRows:(NSArray *)rows;

@end
