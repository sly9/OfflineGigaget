//
//  OfflineGigaget_AppDelegate.h
//  OfflineGigaget
//
//  Created by Sun Liuyi on 11-2-12.
//  Copyright Netease 2011 . All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CoreLogic.h"

@interface OfflineGigaget_AppDelegate : NSObject 
{
    NSWindow *window;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
    CoreLogic *core;
    NSMutableArray *filesToOpen;
}

@property (nonatomic, retain) IBOutlet NSWindow *window;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) CoreLogic *core;
@property (nonatomic, retain) NSMutableArray *filesToOpen;

- (IBAction)saveAction:sender;

@end
