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

#import "EBSDescribeEnvironmentsRequest.h"

@implementation EBSDescribeEnvironmentsRequest

@synthesize applicationName;
@synthesize environmentIds;
@synthesize environmentNames;
@synthesize includeDeleted;
@synthesize includedDeletedBackTo;
@synthesize versionLabel;


-(id)init 
{
    if( self = [super init] ) {
        environmentIds = [[NSMutableArray alloc] init];
        environmentNames = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)dealloc
{
    [applicationName release];
    [environmentIds release];
    [environmentNames release];
    [includedDeletedBackTo release];
    [versionLabel release];
    
    [super dealloc];
}


@end
