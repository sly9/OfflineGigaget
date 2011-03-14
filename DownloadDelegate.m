//
//  DownloadDelegate.m
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-3-13.
//  Copyright 2011年 Netease.com. All rights reserved.
//

#import "DownloadDelegate.h"


@implementation DownloadDelegate

@synthesize downloads;
-(id) init{
    if (![super init]) //if the superclass is NSObject, this must be init
        return nil;
    downloads = [[NSMutableArray array] retain];
    
    return self;
}

/*
- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSString *methodName = NSStringFromSelector(aSelector);
    NSLog(@"DownloadDelegate respondsToSelector: %@", methodName);
    return [super respondsToSelector:aSelector];
}*/

- (void)downloadDidBegin:(NSURLDownload *)download{
    DownloadJob *job = [[DownloadJob alloc] initWithDownload:download];
    
    if ([self getJobForDownload:download]==nil) {
    
        [downloads addObject:job];
        NSLog(@"just added a download job! %@",download);
    }
}

- (void)download:(NSURLDownload *)download decideDestinationWithSuggestedFilename:(NSString *)filename
{
    NSString *destinationFilename;
    NSString *homeDirectory = NSHomeDirectory();
    
    destinationFilename = [[homeDirectory stringByAppendingPathComponent:@"Downloads"]
                           stringByAppendingPathComponent:filename];
    
    [download setDestination:destinationFilename allowOverwrite:NO];
}



- (void)downloadDidFinish:(NSURLDownload *)download {
    NSLog(@"%@ download finished!",download);
    
    [downloads removeObject:[self getJobForDownload:download]];
    [download release];
    
}

- (void)download:(NSURLDownload *)download didFailWithError:(NSError *)error{
    NSLog(@"Download failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);

}

-(void)download:(NSURLDownload *)download didCreateDestination:(NSString *)path {
    NSLog(@"Final file destination: %@",path);
}
- (void)download:(NSURLDownload *)download didReceiveResponse:(NSURLResponse *)response {
    // received basic info for the download job. create file
    DownloadJob *job = [self getJobForDownload:download];
    job.response = response;
    job.fileSize = [response expectedContentLength];
}

- (void)download:(NSURLDownload *)download didReceiveDataOfLength:(NSUInteger)length {
    DownloadJob *job = [self getJobForDownload:download];
    job.receivedLength += length;
//    NSLog(@"received %lld of %lld",job.receivedLength,job.fileSize);
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //[[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"com.apple.DownloadFileFinished" object:pathToFile];
}

-(DownloadJob *) getJobForDownload:(NSURLDownload *)download{
    DownloadJob *job = nil;
    for (DownloadJob *aJob in downloads) {
        if (aJob.download == download ) {
            job = aJob;
            break;
        }
    }
    
    return job;
}

@end
