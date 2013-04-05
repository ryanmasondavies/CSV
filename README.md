CSV
===

Rows are components within tables, which act as composites. A serializer visits each row, formatting as it goes.

Rows are added to a table:

    CSVRow *header = [[CSVRow alloc] initWithValues:@[@"Name", @"Age", @"Country"]];
    CSVRow *ryan = [[CSVRow alloc] initWithValues:@[@"Ryan Davies", @20, @"England"]];
    CSVRow *john = [[CSVRow alloc] initWithValues:@[@"John Smith", @34, @"France"]];
    CSVTable *table = [[CSVTable alloc] initWithRows:@[header, ryan, john]];
    
And serialized:

    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVExporter alloc] initWithOutput:output];
    [exporter serialize:table];
    
Initializing a serializer with a mutable string both exposes for testing and allows the same string to be used in multiple serializations, or other processes.

The above example results in the output:

    Name, Age, Country
    Ryan Davies, 20, England
    John Smith, 34, France
    
Importing this into Excel or Numbers results in a properly formatted spreadsheet.

Installation
============

CSV is installed using [CocoaPods](http://github.com/CocoaPods/CocoaPods) by adding `pod 'CSV', '~> 0.0.1'` to your project's Podfile.

License
=======

    Copyright (c) 2013 Ryan Davies

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
