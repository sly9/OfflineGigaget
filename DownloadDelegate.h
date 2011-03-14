//
//  DownloadDelegate.h
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-3-13.
//  Copyright 2011年 Netease.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "DownloadJob.h"

@interface DownloadDelegate : WebDownload {
    NSMutableArray *downloads;    
}

@property (nonatomic, retain) NSMutableArray *downloads;

-(DownloadJob *) getJobForDownload:(NSURLDownload *)download;

@end
