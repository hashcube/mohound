package com.tealeaf.plugin.plugins;

import com.mohound.sdk.Mohound;
import com.mohound.sdk.ReferrerReceiver;

import com.tealeaf.plugin.IPlugin;
import com.tealeaf.logger;
import com.tealeaf.EventQueue;

import android.app.Activity;
import android.content.Intent;
import android.content.Context;
import android.os.Bundle;
import android.view.*;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.EnumSet;
import java.util.Iterator;
import java.lang.Long;
import java.lang.Float;

import android.R.id.*;

public class MohoundPlugin implements IPlugin {
  Context _ctx;
  Intent _intent;

  public void onCreateApplication(Context applicationContext) {
    this._ctx = applicationContext;
  }

  public void onCreate(Activity activity, Bundle savedInstanceState) {
    Mohound.onCreate(activity);
  }

  public void sendPayment (String data) {
    // parse json data
    try {
      JSONObject params = new JSONObject(data);
      String item = params.optString("item");
      Double price = params.optDouble("price");
      if (item != null && !item.isEmpty() && price != null) {
        Mohound.trackPurchase(price, item);
      }
    } catch (Exception e) {
      logger.log(e);
    }
  }

  public void sendEvent (String data) {
    // parse json data
    try {
      JSONObject params = new JSONObject(data);
      String name = params.optString("name");
      if (name != null && !name.isEmpty()) {
        Mohound.trackAction(name);
      }
    } catch (Exception e) {
      logger.log(e);
    }
  }

  public void onResume() {
  }

  public void onStart() {
  }

  public void onPause() {
  }

  public void onStop() {
  }

  public void onDestroy() {
  }

  public void onNewIntent(Intent intent) {
    this._intent = intent;
  }

  public void setInstallReferrer(String referrer) {
    ReferrerReceiver reciever = new ReferrerReceiver();
    reciever.onReceive(this._ctx, this._intent);
  }

  public void onActivityResult(Integer request, Integer result, Intent data) {
  }

  public void logError(String error) {
  }

  public boolean consumeOnBackPressed() {
    return true;
  }

  public void onBackPressed() {
  }

}
