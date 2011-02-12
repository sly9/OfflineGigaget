//
//  MainWebFrameLoadDelegate.h
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-2-12.
//  Copyright 2011 Netease. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface MainWebFrameLoadDelegate : NSObject{

}
- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame;

@end
