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
#import "EBSLoadBalancer.h"

@implementation EBSLoadBalancer

@synthesize domain;
@synthesize listeners;
@synthesize name;


-(id)init
{
    if( self = [super init] ) {
        listeners = [[NSMutableArray alloc] init];
    }
    return self;       
}

-(void)dealloc
{
    [domain release];
    [listeners release];
    [name release];
    [super dealloc];

}


-(NSString *)debugDescription
{
    NSMutableString *s = [[[NSMutableString alloc] init] autorelease];
    
    [s appendFormat:@"LoadBalancer\n"];
    [s appendFormat:@"\tDomain: %@\n", domain ];
    [s appendFormat:@"\tName: %@\n", name];

    for( id i in listeners ) {
        [s appendFormat:@"\t\t%@", [i debugDescription] ];
    }
    
    return s;
}

@end
