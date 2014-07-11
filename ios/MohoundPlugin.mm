#import "MohoundPlugin.h"

@implementation MohoundPlugin

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
  NSDictionary *ios = [manifest valueForKey:@"ios"];
  NSString *mohoundAppID = [ios valueForKey:@"mohoundAppID"];
  NSString *mohoundSecretKey = [ios valueForKey:@"mohoundSecretKey"];
  [MohoundSDK initWithAppKey:mohoundAppID andSecret:mohoundSecretKey];
  //NOTE: REMOVE THIS IN PRODUCTION
  //[MohoundSDK setDebugMode:YES];
  //[MohoundSDK ping];
}

- (void) applicationWillTerminate:(UIApplication *)app {
}

- (void) applicationDidBecomeActive:(UIApplication *)app {
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return true;
}

- (void) handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication {
}

- (void) didBecomeActive:(NSDictionary *)jsonObject {
}

- (void) trackPurchase:(NSDictionary *)jsonObject {
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
    NSLog(@"price %@", price);
    NSLog(@"item %@", item);
  [MohoundSDK trackPurchaseWithUSDValue:price forItem:item];
}

- (void) trackAction:(NSDictionary *)jsonObject {
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
