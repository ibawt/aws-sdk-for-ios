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
#import "EBSEventDescriptionUnmarshaller.h"

@implementation EBSEventDescriptionUnmarshaller



-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
    

    /*
    if( response == nil ) {
        response = [[EBSEventDescription alloc] init];
    }
     */
    
    if( [elementName isEqualToString:@"Message"] ) {
        self.response.message = self.currentText;
       // NSLog(@"message: %@", self.currentText );
    }
    else if( [elementName isEqualToString:@"EventDate"] ) {
        self.response.eventDate = [AmazonSDKUtil convertStringToDate:self.currentText];
    }
    else if( [elementName isEqualToString:@"VersionLabel"] ) {
        self.response.versionLabel = self.currentText;
    }
    else if( [elementName isEqualToString:@"RequestId"] ) {
        self.response.requestId = self.currentText;
    }
    else if( [elementName isEqualToString:@"ApplicationName"] ) {
        self.response.applicationName = self.currentText;
    }
    else if( [elementName isEqualToString:@"EnvironmentName"] ) {
        self.response.environmentName = self.currentText;
    }
    else if( [elementName isEqualToString:@"Severity"] ) {
        self.response.severity = self.currentText;
    }

    if( [elementName isEqualToString:@"member"] ) {
        if( caller != nil ) {
            [parser setDelegate:caller];
        }
        if( parentObject != nil && [parentObject respondsToSelector:parentSetter ] ) {
            [parentObject performSelector:parentSetter withObject:self.response ];
        }
    }
}

-(EBSEventDescription *)response
{
    if( response == nil ) {
        response = [[EBSEventDescription alloc] init];
        //[response retain];
    }
    
    return response;
}

-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
