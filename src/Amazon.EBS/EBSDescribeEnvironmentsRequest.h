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

@interface EBSDescribeEnvironmentsRequest : AmazonServiceRequestConfig

@property (nonatomic,retain)  NSString *applicationName;
@property (nonatomic,retain ) NSMutableArray *environmentIds;
@property (nonatomic,retain)  NSMutableArray *environmentNames;
@property (nonatomic) BOOL includeDeleted;
@property (nonatomic,retain) NSDate *includedDeletedBackTo;
@property (nonatomic,retain) NSString *versionLabel;

@end
