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

#import <UIKit/UIKit.h>

@interface EBSEnvironmentDescription : NSObject 


@property (nonatomic,retain) NSString *applicationName;
@property (nonatomic,retain) NSString *cname;
@property (nonatomic,retain) NSDate   *dateCreated;
@property (nonatomic,retain) NSDate   *dateUpdated;
@property (nonatomic,retain) NSString *description;
@property (nonatomic,retain) NSString *endpointURL;
@property (nonatomic,retain) NSString *environmentId;
@property (nonatomic,retain) NSString *environmentName;
@property (nonatomic,retain) NSString *health;
@property (nonatomic,retain) NSString *solutionStackName;
@property (nonatomic,retain) NSString *status;
@property (nonatomic,retain) NSString *templateName;
@property (nonatomic,retain) NSString *versionLabel;
@property (nonatomic,retain) NSMutableArray *resources;
@end
