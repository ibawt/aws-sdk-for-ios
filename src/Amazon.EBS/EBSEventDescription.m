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

#import "EBSEventDescription.h"

@implementation EBSEventDescription

@synthesize applicationName;
@synthesize environmentName;
@synthesize eventDate;
@synthesize message;
@synthesize requestId;
@synthesize severity;
@synthesize templateName;
@synthesize versionLabel;



-(NSString *)debugDescription
{
    NSMutableString *s = [[[NSMutableString alloc] init] autorelease];
    
    [s appendFormat:@"Application Name: %@", applicationName ];
    [s appendFormat:@"Environment Name: %@", environmentName ];
    [s appendFormat:@"Message: %@", message ];
    [s appendFormat:@"Severity: %@", severity];
    
    return s;
}

-(void)dealloc {
    [applicationName release];
    [environmentName release];
    [eventDate release];
    [message release];
    [requestId release];
    [severity release];
    [templateName release];
    [versionLabel release];
    
    [super dealloc];
}

@end
