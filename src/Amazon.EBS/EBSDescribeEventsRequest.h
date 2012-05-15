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

#import <AWSiOSSDK/AmazonServiceRequestConfig.h>


#define EBS_TRACE @"TRACE"
#define EBS_DEBUG @"DEBUG"
#define EBS_INFO  @"INFO"
#define EBS_WARN  @"WARN"
#define EBS_ERROR @"ERROR"
#define EBS_FATAL @"FATAL"

@interface EBSDescribeEventsRequest : AmazonServiceRequestConfig {
    NSString *applicationName;
    NSDate   *endTime;
    NSString *environmentId;
    NSString *environmentName;
    NSInteger maxRecords;
    NSString *nextToken;
    NSString *requestId;
    NSString *severity;
    NSDate   *startTime;
    NSString *templateName;
    NSString *versionLabel;
}

@property (nonatomic,retain) NSString *applicationName;
@property (nonatomic,retain) NSDate   *endTime;
@property (nonatomic,retain) NSString *environmentId;
@property (nonatomic,retain) NSString *environmentName;
@property NSInteger maxRecords;
@property (nonatomic,retain) NSString *nextToken;
@property (nonatomic,retain) NSString *requestId;
@property (nonatomic,retain) NSString *severity;
@property (nonatomic,retain) NSDate   *startTime;
@property (nonatomic,retain) NSString *templateName;
@property (nonatomic,retain) NSString *versionLabel;

@end
