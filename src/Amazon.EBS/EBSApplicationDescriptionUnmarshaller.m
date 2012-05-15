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
#import "EBSApplicationDescriptionUnmarshaller.h"
#import <AWSiOSSDK/AmazonListUnmarshaller.h>
#import <AWSiOSSDK/AmazonValueUnmarshaller.h>

@implementation EBSApplicationDescriptionUnmarshaller

-(AmazonUnmarshallerXMLParserDelegate *) initWithCaller:(AmazonUnmarshallerXMLParserDelegate *)aCaller withParentObject:(id)parent withSetter:(SEL)setter {
    if( self = [ super initWithCaller:aCaller withParentObject:parent withSetter:setter ] ) {
        
    }
    
    NSLog(@"flkdsjfklasdjfkdsl");
    return self;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];
    
    if( [elementName isEqualToString:@"Versions"] ) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.versions withSetter:@selector(addObjectsFromArray:)] autorelease];
        
        listUnmarshaller.endElementTagName = @"Versions";
        listUnmarshaller.entryElementName = @"member";
        listUnmarshaller.delegateClass = [AmazonValueUnmarshaller class];
        
        [parser setDelegate:listUnmarshaller];
    }
    
if( [elementName isEqualToString:@"ConfigurationTemplates"] ) {
    AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.configurationTemplates withSetter:@selector(addObjectsFromArray:)] autorelease];
    
    listUnmarshaller.endElementTagName = @"ConfigurationTemplates";
    listUnmarshaller.entryElementName = @"member";
    listUnmarshaller.delegateClass = [AmazonValueUnmarshaller class];
    
    [parser setDelegate:listUnmarshaller];
}
    
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if( [elementName isEqualToString:@"Description"] ) {
        self.response.description = self.currentText;
    } else if( [elementName isEqualToString:@"ApplicationName"] ) {
        self.response.applicationName = self.currentText;
    } else if( [elementName isEqualToString:@"DateCreated"] ) {
        self.response.dateCreated = [AmazonSDKUtil convertStringToDate:self.currentText];
    } else if( [elementName isEqualToString:@"DateUpdated"] ) {
        self.response.dateUpdated = [AmazonSDKUtil convertStringToDate:self.currentText];
    }
//    
    if( [elementName isEqualToString:@"member"] ) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }
        
        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

    }
}

-(EBSApplicationDescription *)response
{
    if( response == nil ) {
        response = [[EBSApplicationDescription alloc] init];
    }
    return response;
}

-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
