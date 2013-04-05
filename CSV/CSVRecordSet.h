//
//  CSVRecordSet.h
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSVComponent.h"
@protocol CSVVisitor;

@interface CSVRecordSet : NSObject <CSVComponent>

/**
 Initialize a record set with an array of records.
 @param records The records in the record set.
 @return An initialized record set.
 */
- (id)initWithRecords:(NSArray *)records;

@end
