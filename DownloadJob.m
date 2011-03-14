//
//  DownloadJob.m
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-3-14.
//  Copyright 2011年 Netease.com. All rights reserved.
//

#import "DownloadJob.h"


@implementation DownloadJob

@synthesize fileSize, receivedLength, download, response;

-(id) initWithDownload:(NSURLDownload *)aDownload{
    if (![super init]) //if the superclass is NSObject, this must be init
        return nil;
    self.download = aDownload;
    self.fileSize = 0;
    self.receivedLength = 0;
    return self;
}

@end
