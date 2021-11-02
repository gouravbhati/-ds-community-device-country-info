package com.reactnativecountry;

import android.content.Context;
import android.os.Build;
import android.telephony.TelephonyManager;

import javax.annotation.Nonnull;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class CountryModule extends ReactContextBaseJavaModule {
  public static final String NAME = "Country";

  public CountryModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  @Nonnull
  public String getName() {
    return NAME;
  }


  @ReactMethod
  public void multiply(int a, int b, Promise promise) {
    promise.resolve(a * b);
  }

  public static native int nativeMultiply(int a, int b);

//  @ReactMethod
//  @SuppressWarnings("deprecation")
//  public void getCurrentCountry(Promise promise) {
//    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N)
//       promise.resolve(getReactApplicationContext().getResources().getConfiguration().getLocales().get(0).getCountry());
//    else
//      promise.resolve(getReactApplicationContext().getResources().getConfiguration().locale.getCountry());
//  }

  @ReactMethod
  @SuppressWarnings("deprecation")
  public void getCurrentCountry(Promise promise) {

    TelephonyManager tm = (TelephonyManager)getReactApplicationContext().getSystemService(Context.TELEPHONY_SERVICE);
    String countryCodeValue = tm.getNetworkCountryIso();

      promise.resolve(countryCodeValue);
  }

//  @ReactMethod
//  @SuppressWarnings("deprecation")
//  fun getCurrentCountry():
//  String {
//    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N)
//      reactApplicationContext.resources.configuration.locales.get(0).country
//    else
//      reactApplicationContext.resources.configuration.locale.country
//  }
}
