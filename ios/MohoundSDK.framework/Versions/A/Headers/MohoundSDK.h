//
//  MohoundSDK.h
//  MohoundSDK 0.1.12 (4dfd788)
//
//  Created by Carlos Mondragon on 26/11/12.
//  Copyright (c) 2012-2014 Mohound Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface MohoundSDK : NSObject

/**
 * Initializes the Mohound tracker and sends an open event to the servers.
 */
+ (void)initWithAppKey:(NSString *)appKey andSecret:(NSString *)appSecret;

/**
 * Tracks an outside apple-word purchase event. The amount has to be in USD.
 */
+ (void)trackPurchaseWithUSDValue:(NSNumber *)value forItem:(NSString *)item;

/**
 * Registers the in-app purchases inventory. Receives the products array given
 * back from Apple in the success callback.
 * E.g.
 *  - (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
 *  {
 *    ...
 *    [MohoundSDK registerProducts:response.products];
 *    ...
 *  }
 */
+ (void)registerProducts:(NSArray *)productsArray;

/**
 * Tracks an in-app purchase. Receives the product identifier given back from
 * Apple in the success callback
 * (SKPaymentTransaction.payment.productIdentifier)
 */
+ (void)trackPurchase:(SKPaymentTransaction *)transaction;

/**
 * Tracks an action. An action is a valuable user interaction for an app. It
 * represents what the user is supposed to do within the app. It will be used
 * to make marketing decisions. E.g. it can be a user giving a
 * review, signing up, or inviting a friend to use an app.
 */
+ (void)trackAction:(NSString *)actionName;

/**
 * Pings the server, shoud get a PONG as the response
 */
+ (void)ping;

/**
 * Enables debugging when set to true.
 */
+ (void)setDebugMode:(BOOL)debugMode;

@end
