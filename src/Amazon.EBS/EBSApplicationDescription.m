/*
 * Copyright 2010-2012 Ian Quick. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "EBSApplicationDescription.h"

@implementation EBSApplicationDescription

@synthesize applicationName;
@synthesize configurationTemplates;
@synthesize dateCreated;
@synthesize dateUpdated;
@synthesize versions;
@synthesize description;


-(id)init {
    if( self = [super init] ) {
        versions = [[NSMutableArray alloc] init];
        configurationTemplates = [[NSMutableArray alloc] init];
    }
    return self;
}


-(NSString *)debugDescription
{
    NSMutableString *s = [[NSMutableString alloc] init];
    
    [s appendFormat:@"applicationName = %@\n", applicationName ];
    [s appendFormat:@"dateCreated = %@\n", dateCreated];
    [s appendFormat:@"dateUpdated = %@\n", dateUpdated ];
    [s appendFormat:@"description = %@\n", description ];
    for( NSString *str in configurationTemplates ) {
        [s appendFormat:@"config template: %@\n", str ];
    }
    for( NSString *str in versions ) {
        [s appendFormat:@"version = %@\n", str ];
    }
    
    return [s autorelease];
}

-(void)dealloc 
{
    [versions release];
    [configurationTemplates release];
    
    [applicationName release];
    [dateCreated release];
    [dateUpdated release];
    [description release];
    
    [super dealloc];
}
@end
