//
//  CSVComponent.h
//  CSV
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CSVVisitor;

/** Interface for any component in a hierarchy. */
@protocol CSVComponent <NSObject>

/**
 Accept a visitor.
 Composites (groups) forward the visitor to each component.
 Components invoke the appropriate method on the visitor.
 @param visitor The visitor to accept.
 */
- (void)accept:(id<CSVVisitor>)visitor;

@end
