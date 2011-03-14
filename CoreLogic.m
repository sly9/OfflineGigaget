//
//  CoreLogic.m
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-2-12.
//  Copyright 2011 Netease. All rights reserved.
//

#import "CoreLogic.h"

@implementation CoreLogic
@synthesize window,webView,mainWebFrameLoadDelegate,clipboard,lastHandledURL,downloadDelegate;

// register the protocols like "magnet","emule" so that the system will call me when you click the url
- (void)registerMyApp {
	[[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(getUrl:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}



- (void)getUrl:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
	NSString *url = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
    NSLog(@"about to handle url: %@",url);
    [self.mainWebFrameLoadDelegate handleURLDownload:self.webView forURL:url];
	// Now you can parse the URL and perform whatever action is needed
}

- (void)checkClipBoard {
    NSURL *url = [NSURL URLWithString:[[NSString alloc] initWithData:[self.clipboard dataForType:NSPasteboardTypeString]  encoding:NSUTF8StringEncoding]];
    if (url==nil) {
        return;
    }
    
    if ([url isEqual:lastHandledURL]) {
        return;
    }
    self.lastHandledURL = url;
    [self.mainWebFrameLoadDelegate handleURLDownload:self.webView forURL:[url description]];
    
    NSLog(@"check again! %@",url);
}


- (void)setup{
    // prepare web view
    NSRect windowFrame = [[window contentView] frame];
    WebView *aWebView = [[WebView alloc] initWithFrame:NSMakeRect(0, 0, windowFrame.size.width,windowFrame.size.height) frameName:@"aa" groupName:@"aa"];
    [[window contentView] addSubview:aWebView];
    [aWebView setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
    
    self.webView = aWebView;
    [aWebView release];
    
    // set delegate for web view
    MainWebFrameLoadDelegate *aMainWebFrameLoadDelegate = [[[MainWebFrameLoadDelegate alloc] init] autorelease];
    self.mainWebFrameLoadDelegate = aMainWebFrameLoadDelegate;
    [self.webView setFrameLoadDelegate:aMainWebFrameLoadDelegate];
    
    self.downloadDelegate = [[[DownloadDelegate alloc] init] autorelease];
    [self.webView setDownloadDelegate:self.downloadDelegate];
    [self.webView setPolicyDelegate:aMainWebFrameLoadDelegate];
    [self.webView setResourceLoadDelegate:aMainWebFrameLoadDelegate];
    
    //load homepage
    [[self.webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://lixian.xunlei.com"]]];
    [self registerMyApp];
    
    self.clipboard = [NSPasteboard generalPasteboard];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(checkClipBoard) userInfo:nil repeats:YES];
}

- (void) dealloc{
    [window release];
    [webView release];
    [mainWebFrameLoadDelegate release];
    [super dealloc];
    
}

@end
