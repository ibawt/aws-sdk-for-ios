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

#import "ElasticBeanStalkClient.h"
#import "EBSDescribeApplicationsResponseUnmarshaller.h"
#import "EBSApplicationDescription.h"
#import "EBSDescribeEventsResponseUnmarshaller.h"
#import "EBSDescribeEnvironmentsResponseUnmarshaller.h"
#import "EBSRebuildEnvironmentResponseUnmarshaller.h"

#define END_POINT @"https://elasticbeanstalk.us-east-1.amazonaws.com"

@implementation ElasticBeanStalkClient




-(id)init {
    if( self = [super init] ) {
        self.endpoint = END_POINT;
    }
    
    [AmazonLogger verboseLogging];
    return self;
}

-(id)initWithAccessKey:(NSString *)accessKey withSecretKey:(NSString *)secretKey  {
    if( self = [super initWithAccessKey:accessKey withSecretKey:secretKey] ) {
        self.endpoint = END_POINT;
    }
    return self;
}

+(id)constructResponseFromRequest:(EBSRequest *)request
{
    NSString *requestClassName  = NSStringFromClass([request class]);
    NSString *responseClassName = [[requestClassName substringToIndex:[requestClassName length] - 7] stringByAppendingFormat:@"Response"];
    
    id       response = [[NSClassFromString(responseClassName) alloc] init];
    
    if (nil == response) {
        response = [[EBSResponse alloc] init];
    }
    
    return response;
}


-(EBSRestartAppServerResponse*)restartAppServer:(EBSRestartAppServerRequest*)request
{
    
}


-(EBSRebuildEnvironmentResponse*)rebuildEnvironment:(EBSRebuildEnvironmentRequest *)request 
{
    AmazonServiceRequest *req = [[[EBSRequest alloc] init] autorelease];
    if( request.environmentId ) {
        [req setParameterValue:request.environmentId forKey:@"EnvironmentId"];
    }
    
    if( request.environmentName ) {
        [req setParameterValue:request.environmentName forKey:@"EnvironmentName"];
    }
    
    return (EBSRebuildEnvironmentResponse*)[self invoke:req rawRequest:request unmarshallerDelegate:[EBSRebuildEnvironmentResponseUnmarshaller class]];
                                            
    
}


-(EBSDescribeEnvironmentsResponse*)describeEnvironments:(EBSDescribeEnvironmentsRequest *)request
{
    AmazonServiceRequest *req = [[[EBSRequest alloc] init] autorelease];
    [req setHttpMethod:@"GET"];
    
    if( request.applicationName ) {
        [req setParameterValue:request.applicationName forKey:@"ApplicationName"];
    }
    
    if( request.includeDeleted ) {
        [req setParameterValue:@"true" forKey:@"IncludeDeleted"];
    }
    
    if( request.includedDeletedBackTo ) {
        [req setParameterValue:[request.includedDeletedBackTo stringWithRFC822Format] forKey:@"IncludedDeleteBackTo"];
    }
    
    if( request.versionLabel ) {
        [req setParameterValue:request.versionLabel forKey:@"VersionLabel"];
    }
    
    [req setParameterValue:@"DescribeEnvironments" forKey:@"Action"];
    
    return (EBSDescribeEnvironmentsResponse*)[self invoke:req rawRequest:request unmarshallerDelegate:[EBSDescribeEnvironmentsResponseUnmarshaller class]];
    
}


-(EBSDescribeEventsResponse*)describeEvents:(EBSDescribeEventsRequest *)request
{
    AmazonServiceRequest *req = [[[EBSRequest alloc] init] autorelease];
    [req setHttpMethod:@"GET"];
    [req setParameterValue:@"DescribeEvents" forKey:@"Action"];
    
    if( request.applicationName && [request.applicationName length] > 0 ) {
        [req setParameterValue:request.applicationName forKey:@"ApplicationName"];
    }
    
    if( request.endTime ) {
        [req setParameterValue:[request.endTime stringWithISO8061Format] forKey:@"EndTime"];
    }
    
    if( request.environmentId ) {
        [req setParameterValue:request.environmentId forKey:@"EnvironmentId"];
    }
    
    if( request.environmentName ) {
        [req setParameterValue:request.environmentName forKey:@"EnvironmentName"];
    }
    
    if( request.maxRecords ) {
        [req setParameterValue:[NSString stringWithFormat:@"%d", request.maxRecords] forKey:@"MaxRecords"];
    }
    
    if( request.nextToken ) {
        [req setParameterValue:request.nextToken forKey:@"NextToken"];
    }
    
    if( request.requestId ) {
        [req setParameterValue:request.requestId forKey:@"RequestId"];
    }
    
    if( request.severity ) {
        [req setParameterValue:request.severity forKey:@"Severity"];
    }
    
    if( request.startTime ) {
        [req setParameterValue:[request.startTime dateStamp] forKey:@"StartTime"];
    }
    
    if( request.templateName ) {
        [req setParameterValue:request.templateName forKey:@"TemplateName"];
    }
    
    if( request.versionLabel ) {
        [req setParameterValue:request.versionLabel forKey:@"VersionLabel"];
    }
    
    EBSDescribeEventsResponse *resp = (EBSDescribeEventsResponse *)[self invoke:req rawRequest:request unmarshallerDelegate:[EBSDescribeEventsResponseUnmarshaller class]];
    
    return resp;
}


-(EBSDescribeApplicationsResponse*)describeApplications:(EBSDescribeApplicationsRequest*)request
{
    //[AmazonLogger verboseLogging];

    AmazonServiceRequest *req = [[[EBSRequest alloc] init ] autorelease];
    [req setHttpMethod:@"GET"];
    [req setParameterValue:@"DescribeApplications" forKey:@"Action"];
    
    
    EBSDescribeApplicationsResponse *resp = (EBSDescribeApplicationsResponse*)[self invoke:req rawRequest:request unmarshallerDelegate:[EBSDescribeApplicationsResponseUnmarshaller class]];
    
    for( EBSApplicationDescription *app in resp.applicationList ) {
        NSLog(@"%@", app.debugDescription );
    }
    
    
    return resp;
}


-(EBSResponse *)invoke:(EBSRequest *)request
{
    if( !request ) {
        @throw [AmazonClientException exceptionWithMessage:@"Request cannot be nil"];
    }
    
    [request setUserAgent:self.userAgent];
    
    if( !request.endpoint  ) {
        [request setEndpoint:self.endpoint];
    }
    
    /*
    if (request.securityToken == nil)
    {
        if(request.credentials == nil && credentials.securityToken != nil)
        {
            request.securityToken = credentials.securityToken;
        }
        else if(request.credentials.securityToken != nil)
        {
            request.securityToken = request.credentials.securityToken;
        }
    }
     */
    [request setCredentials:credentials];
    
    AMZLogDebug(@"Begin Request: %@", NSStringFromClass([request class]));
    
    EBSResponse *response = nil;
    int retries = 0;
    
    while( retries < self.maxRetries ) {
        if( retries > 0 ) {
            request.date = [NSDate date];
        }
        [request sign];
        NSURLRequest *urlRequest = [request configureURLRequest];
        
        AMZLogDebug(@"%@ %@", [urlRequest HTTPMethod], [urlRequest URL]);
        AMZLogDebug(@"Request headers: ");
        for (id hKey in [[urlRequest allHTTPHeaderFields] allKeys])
        {
            AMZLogDebug(@"  %@: %@", [hKey description], [[urlRequest allHTTPHeaderFields] valueForKey:hKey]);
        }
        
        response = (EBSResponse *)[ElasticBeanStalkClient constructResponseFromRequest:request];
        [response setRequest:request];

        
        NSURLConnection *urlConnection = [NSURLConnection connectionWithRequest:urlRequest delegate:response];
        NSTimer         *timeoutTimer  = [NSTimer scheduledTimerWithTimeInterval:self.timeout target:response selector:@selector(timeout) userInfo:nil repeats:NO];
        
        request.urlConnection = urlConnection;
        
        if ([request delegate] == nil) {
            while (!response.isFinishedLoading && !response.exception && !response.didTimeout) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            
            if (response.didTimeout) {
                [urlConnection cancel];
            }
            else {
                [timeoutTimer invalidate];      //  invalidate also releases the object.
            }
            
            AMZLogDebug(@"Response Status Code : %d", response.httpStatusCode);
            if ( [self shouldRetry:response]) {
                AMZLogDebug(@"Retring Request: %d", retries);
                
                [self pauseExponentially:retries];
                retries++;
            }
            else {
                if (response.exception) {
                    AMZLogDebug(@"Request threw exception: %@", [response.exception description]);
                    if ([response.exception isMemberOfClass:[AmazonServiceException class]]) {
                        AMZLogDebug(@"HTTP: %d, S3 Error Code: %@", ((AmazonServiceException *)response.exception).statusCode, ((AmazonServiceException *)response.exception).errorCode);
                    }
                    AMZLogDebug(@"Reason: ", [response.exception reason]);
                    @throw response.exception;
                }
                
                break;
            }
        } else {
            return nil;
        }
    }
    
    if (response.exception) {
        AMZLogDebug(@"Request threw exception: %@", [response.exception description]);
        if ([response.exception isMemberOfClass:[AmazonServiceException class]]) {
            AMZLogDebug(@"HTTP: %d, S3 Error Code: %@", ((AmazonServiceException *)response.exception).statusCode, ((AmazonServiceException *)response.exception).errorCode);
        }
        AMZLogDebug(@"Reason: ", [response.exception reason]);
        @throw response.exception;
    }
    
    AMZLogDebug(@"Received response from server. RequestId: %@. HTTP: %d. Id2: %@.", response.requestId, response.httpStatusCode, @""/*response.id2*/);
    AMZLogDebug(@"Response [%@]", response);
    
    return response;

    
    return nil;
}

@end
