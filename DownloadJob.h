//
//  DownloadJob.h
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-3-14.
//  Copyright 2011年 Netease.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DownloadJob : NSObject {
    long long fileSize;
    long long receivedLength;
    NSURLDownload *download;
    NSURLRequest *request;
    NSURLResponse *response;
}

@property (nonatomic, assign) long long fileSize;
@property (nonatomic, assign) long long receivedLength;
@property (nonatomic, retain) NSURLDownload *download;
@property (nonatomic, retain) NSURLResponse *response;

-(id) initWithDownload:(NSURLDownload *)download;

@end
