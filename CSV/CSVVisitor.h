//
//  CSVVisitor.h
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CSVRow;

/** Interface for all visitors. */
@protocol CSVVisitor <NSObject>

/** Visit a row. Invoked by [CSVRow accept:]. */
- (void)visitRow:(CSVRow *)row;

@end
