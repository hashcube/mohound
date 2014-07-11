# Game Closure DevKit Plugin: Mohound

This plugin allows you to get mobile app installs using [Mohound](http://mohound.com/) toolkit.  Both iOS and Android targets are supported.

## Usage

Install the addon by cloning it to `DEVKIT/addons`.

Include it in the `manifest.json` file under the "addons" section for your game:

~~~
"addons": [
  "mohound"
],
~~~

To specify your game's AppID and AppSignature, edit the `manifest.json "android" and "ios" sections as shown below:

~~~
  "android": {
    "versionCode": 1,
    "icons": {
      "36": "resources/icons/android36.png",
      "48": "resources/icons/android48.png",
      "72": "resources/icons/android72.png",
      "96": "resources/icons/android96.png"
    },
    "MohoundAppKey": "6362025dc1d6eb0ff7cf1a17e256dce9",
    "MohoundAppSecret": "629751d0e89401312ca822000a2191fc"
    "MohoundDebugMode": true // Enable debugging set false or remove to disable
  },
~~~

~~~
  "ios": {
    "bundleID": "mmp",
    "appleID": "568975017",
    "version": "1.0.3",
    "icons": {
      "57": "resources/images/promo/icon57.png",
      "72": "resources/images/promo/icon72.png",
      "114": "resources/images/promo/icon114.png",
      "144": "resources/images/promo/icon144.png"
    },
    "MohoundAppKey": "6362025dc1d6eb0ff7cf1a17e256dce9",
    "MohoundAppSecret": "629751d0e89401312ca822000a2191fc"
    "MohoundDebugMode": true // Enable debugging set false or remove to disable
  },
~~~

Note that the manifest keys are case-sensitive.

#Usage
import mohound plugin using `import plugins.mohound.mohound as mohound`

### API
````!javascript
mohound.sendPayment(item, price);
````
- item: name of item `String`;
- price: price of item `Integer/Double`

````!javascript
mohound.sendEvent(name);
````
- name: name of the event `String`


Note:
To test `Android's` `INSTALL_REFERRER`
````!bash
  adb shell am broadcast -a com.android.vending.INSTALL_REFERRER -n com.yourpackage.yourapp/com.tealeaf.TeaLeafReceiver --es "referrer" "utm_source=test_source&utm_medium=test_medium&utm_term=test_term&utm_content=test_content&utm_campaign=test_name"
````
