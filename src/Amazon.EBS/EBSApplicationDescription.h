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

@interface EBSApplicationDescription : NSObject {
    NSString *applicationName;
    NSArray  *configurationTemplates;
    NSDate   *dateCreated;
    NSDate   *dateUpdated;
    NSString *description;
    NSMutableArray  *versions;
    
    NSString *debugDescription;
}

@property (nonatomic,retain) NSString *applicationName;
@property (nonatomic,retain) NSArray  *configurationTemplates;
@property (nonatomic,retain) NSDate   *dateCreated;
@property (nonatomic,retain) NSDate   *dateUpdated;
@property (nonatomic,retain) NSString * description;
@property (nonatomic,retain) NSMutableArray *versions;
@property (nonatomic,readonly) NSString *debugDescription;

@end
