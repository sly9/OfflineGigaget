//
//  CoreLogic.m
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-2-12.
//  Copyright 2011 Netease. All rights reserved.
//

#import "CoreLogic.h"

@implementation CoreLogic
@synthesize window,webView,mainWebFrameLoadDelegate;

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
    
    //load homepage
    [[self.webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://lixian.xunlei.com"]]];
}

- (void) dealloc{
    [window release];
    [webView release];
    [mainWebFrameLoadDelegate release];
    [super dealloc];
    
}


@end
