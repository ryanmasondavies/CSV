// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>
#import "CSVVisitor.h"
@protocol CSVComponent;

/** Serializes rows, that is converts rows to data in CSV format. */
@interface CSVSerializer : NSObject <CSVVisitor>

/**
 * Set a char separating the values. Default value is ','.
 **/
@property (nonatomic, strong) NSString *separatorChar;

/**
 * Sets line breaks for different systems. Default value is '\n'.
 */
@property (nonatomic, strong) NSString *lineBreak;

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
