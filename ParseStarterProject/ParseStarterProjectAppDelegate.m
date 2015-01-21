
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

#import "ParseStarterProjectAppDelegate.h"
#import "MyTableController.h"

@implementation ParseStarterProjectAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // ****************************************************************************
    // Uncomment and fill in with your Parse credentials:
    [Parse setApplicationId:@"APPLICATION_ID_HERE" clientKey:@"CLIENT_KEY_HERE"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    // Override point for customization after application launch.

    MyTableController *controller = [[MyTableController alloc] init];
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self.window makeKeyAndVisible];
    
    // Let's make an object each launch, so there's definitely something to display.
    
    PFObject *object = [PFObject objectWithClassName:@"Todo"];
    [object setObject:@"Sample Text" forKey:@"text"];
    [object setObject:@1 forKey:@"priority"];
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        // Refresh the table when the object is done saving.
        [controller loadObjects];
    }];
  
    return YES;
}

@end
