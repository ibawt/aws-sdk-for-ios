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
#import "EBSEnvironmentDescriptionUnmarshaller.h"
#import <AWSiOSSDK/AmazonListUnmarshaller.h>
#import "EBSLoadBalancerUnmarshaller.h"

@implementation EBSEnvironmentDescriptionUnmarshaller 




-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];
    

    if( [elementName isEqualToString:@"Resources"] ) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.resources withSetter:@selector(addObjectsToArray:)] autorelease];
        
        listUnmarshaller.entryElementName = @"LoadBalancer";
        listUnmarshaller.endElementTagName = @"Resources";
        listUnmarshaller.delegateClass = [EBSLoadBalancerUnmarshaller class];
        [parser setDelegate:listUnmarshaller];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];
    

    if( [elementName isEqualToString:@"VersionLabel"] ) {
        self.response.versionLabel = self.currentText;
    } 
    else if( [elementName isEqualToString:@"Status"] ) {
        self.response.status = self.currentText;
    }
    else if( [elementName isEqualToString:@"ApplicationName"] ) {
        self.response.applicationName = self.currentText;
    }
    else if( [elementName isEqualToString:@"EndpointURL"] ) {
        self.response.endpointURL = self.currentText;
    }
    else if( [elementName isEqualToString:@"CNAME"] ) {
        self.response.cname = self.currentText;
    }
    else if( [elementName isEqualToString:@"Health"] ) {
        self.response.health = self.currentText;
    }
    else if( [elementName isEqualToString:@"EnvironmentId"] ) {
        self.response.environmentId = self.currentText;
    }
    else if( [elementName isEqualToString:@"DateUpdated"] ) {
        self.response.dateUpdated = [AmazonSDKUtil convertStringToDate:self.currentText];
    }
    else if( [elementName isEqualToString:@"DateCreated"] ) {
        self.response.dateCreated = [AmazonSDKUtil convertStringToDate:self.currentText];
    }
    else if( [elementName isEqualToString:@"SolutionStackName"] ) {
        self.response.solutionStackName = self.currentText;
    }
    else if( [elementName isEqualToString:@"Description"] ) {
        self.response.description = self.currentText;
    }
    else if( [elementName isEqualToString:@"EnvironmentName"] ) {
        self.response.environmentName = self.currentText;
    }
    /*
    else if( [elementName isEqualToString:@"member"] ) {
        
        NSLog(@"%@", [self.response debugDescription] );
        if( caller != nil ) {
            [parser setDelegate:caller];
        }
        if( parentObject != nil && [parentObject respondsToSelector:parentSetter ] ) {
            [parentObject performSelector:parentSetter withObject:self.response ];
        }
    }
*/
}


-(EBSEnvironmentDescription*)response
{
    if( response == nil ) {
        response = [[EBSEnvironmentDescription alloc] init];
    }
    
    return response;
}

-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
