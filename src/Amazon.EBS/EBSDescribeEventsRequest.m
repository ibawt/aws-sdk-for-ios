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

#import "EBSDescribeEventsRequest.h"

@implementation EBSDescribeEventsRequest

@synthesize applicationName, endTime,environmentId,environmentName,maxRecords,nextToken,requestId,severity,startTime,templateName,versionLabel;



-(void)dealloc
{
    [applicationName release];
    [endTime release];
    [environmentId release];
    [environmentName release];
    [nextToken release];
    [requestId release];
    [severity release];
    [startTime release];
    [templateName release];
    [versionLabel release];
    
    [super dealloc];
    
}


@end
