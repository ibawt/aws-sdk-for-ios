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

#import "EBSEnvironmentDescription.h"

@implementation EBSEnvironmentDescription

@synthesize applicationName;
@synthesize cname;
@synthesize dateCreated ;
@synthesize dateUpdated;
@synthesize description;
@synthesize endpointURL;
@synthesize environmentId;
@synthesize environmentName;
@synthesize health;
@synthesize solutionStackName;
@synthesize status;
@synthesize templateName;
@synthesize versionLabel;
@synthesize resources;


-(id)init
{
    if( self = [super init] ) {
        resources = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)debugDescription
{
    NSMutableString *s = [[[NSMutableString alloc] init] autorelease];
    
    
    [s appendFormat:@"EnvironmentDescription: %@\n", applicationName ];
    [s appendFormat:@"\tCNAME:%@\n", cname];
    [s appendFormat:@"\tdescription: %@\n", description];
    [s appendFormat:@"\tendpointURL: %@\n", endpointURL];
    [s appendFormat:@"\tenvironmentId: %@\n", environmentId];
    [s appendFormat:@"\tenvironmentName: %@\n", environmentName];
    [s appendFormat:@"\thealth: %@\n", health];
    [s appendFormat:@"\tsolutionStackName: %@\n", solutionStackName];
    [s appendFormat:@"\tstatus: %@\n", status];
    [s appendFormat:@"\ttemplateName: %@\n", templateName];
    [s appendFormat:@"\tversionLabel: %@\n", versionLabel];
    for( id i in resources ) {
        [s appendFormat:@"\t\t%@\n", [i debugDescription] ];
    }
    
    return s;
    
}


-(void)dealloc
{
    [applicationName release];
    [cname release];
    [dateCreated release];
    [dateUpdated release];
    [description release];
    [endpointURL release];
    [environmentId release];
    [environmentName release];
    [health release];
    [solutionStackName release];
    [status release];
    [templateName release];
    [versionLabel release];
    [resources release];
    
    [super dealloc];
    
}

@end
