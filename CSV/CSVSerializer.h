//
//  CSVSerializer.h
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSVVisitor.h"
@protocol CSVComponent;

/** Serializes rows, that is converts rows to data in CSV format. */
@interface CSVSerializer : NSObject <CSVVisitor>

/**
 Initialize a serializer.
 @param output The output of the serializer.
 @return An initialized serializer.
 */
- (id)initWithOutput:(NSMutableString *)output;

/**
 Serialize a component.
 @param component The component to serialize.
 */
- (void)serialize:(id<CSVComponent>)component;

@end
