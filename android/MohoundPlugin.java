package com.tealeaf.plugin.plugins;

import com.mohound.sdk.Mohound;

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
  HashMap<String, String> manifestKeyMap = new HashMap<String, String>();

  // on create
  @Override
  public void onCreate(Activity activity, Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    Mohound.onCreate(this);
  }

  public void sendPayment (JSONObject params) {
    // parse json data
    try {
      JSONObject params = new JSONObject(data);
      String item = params.optString("item");
      String price = params.optString("price");
      if (item != null && !item.isEmpty() && price != null && !price.isEmpty()) {
        Mohound.trackPurchase(item, price);
      }
    }
  }

  public void sendEvent (JSONObject params) {
    // parse json data
    try {
      JSONObject params = new JSONObject(data);
      String name = params.optString("name");
      if (name != null && !name.isEmpty()) {
        Mohound.trackAction(name);
      }
    }
  }

}
