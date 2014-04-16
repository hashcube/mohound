#import <MohoundSDK/MohoundSDK.h>
#import "MohoundPlugin.h"

@implementation MohoundPlugin

@synthesize MohoundPlugin;

// The plugin must call super dealloc.
- (void) dealloc {
	[super dealloc];
}

// The plugin must call super init.
- (id) init {
	self = [super init];
	if (!self) {
		return nil;
	}
	return self;
}


- (void) initializeWithManifest:(NSDictionary *)manifest appDelegate:(TeaLeafAppDelegate *)appDelegate {
}

- (void) applicationWillTerminate:(UIApplication *)app {
}

- (void) applicationDidBecomeActive:(UIApplication *)app {
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MohoundSDK initWithAppKey:@"d7d91de8f4b0ebd3827b6e6a5de57d77" andSecret:@"5f0f11008a430131c92b7efd45a4c1ef"];
    [MohoundSDK setDebugMode:YES];
    [MohoundSDK ping];
}

- (void) handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication {
}

- (void) didBecomeActive:(NSDictionary *)jsonObject {
}

- (void) sendPayment:(NSDictionary *)jsonObject {
    NSString *item =  [NSString stringWithFormat:@""];
    NSNumber *price;

    for (id key in jsonObject) {
        id o = [jsonObject objectForKey:key];
        if([key isEqual:@"item"]){
            item = o;
            continue;
        }
        if([key isEqual:@"price"]){
            price = o;
            continue;
        }
    }

    [Mohound trackPurchaseWithUSDValue:price forItem:item];
}

- (void) sendEvent:(NSDictionary *)jsonObject {
    NSString *name =  [NSString stringWithFormat:@""];

    for (id key in jsonObject) {
        id o = [jsonObject objectForKey:key];
        if([key isEqual:@"name"]){
            name = o;
            continue;
        }
    }
    
    [MohoundSDK trackAction:name];
}
@end