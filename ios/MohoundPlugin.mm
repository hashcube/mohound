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
  NSLog(@"==================");
  NSLog(@"==================");
  NSLog(@"==================");
  NSLog(@"==================");
  NSLog(@"Oh i am here");
  NSDictionary *ios = [manifest valueForKey:@"ios"];
  NSString *mohoundAppID = [ios valueForKey:@"mohoundAppID"];
  NSString *mohoundSecretKey = [ios valueForKey:@"mohoundSecretKey"];
  [MohoundSDK initWithAppKey:mohoundAppID andSecret:mohoundSecretKey];
  //***************************
  //***************************
  //***************************
  //***************************
  //***************************
  //REMOVE THIS IN PRODUCTION
  //***************************
  //***************************
  //***************************
  //***************************
  [MohoundSDK setDebugMode:YES];
  [MohoundSDK ping];
  //***************************
  //***************************
  //***************************
  //***************************
  //REMOVE TILL HERE
  //***************************
  //***************************
  //***************************
}

- (void) applicationWillTerminate:(UIApplication *)app {
}

- (void) applicationDidBecomeActive:(UIApplication *)app {
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"======================");
    NSLog(@"======================");
    NSLog(@"======================");
    NSLog(@"======================");
    NSLog(@"It is being called");
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