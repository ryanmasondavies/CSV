//
//  CSVVisitor.h
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CSVRecord;

/** Interface for all record visitors. */
@protocol CSVVisitor <NSObject>

/** Visit a record. Invoked by [CSVRecord accept:]. */
- (void)visitRecord:(CSVRecord *)record;

@end
