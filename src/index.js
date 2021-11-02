import { NativeModules, Platform } from 'react-native';

const countries = require('./countrys.json');

const LINKING_ERROR =
  `The package 'react-native-country' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const Country = NativeModules.Country
  ? NativeModules.Country
  : new Proxy(
    {},
    {
      get() {
        throw new Error(LINKING_ERROR);
      },
    }
  );

// export function multiply(a: number, b: number): Promise<number> {
//   return Country.multiply(a, b);
// }

export function getDeviceCountry() {

  return new Promise((resolve, reject) => {

    if (Country?.getDeviceCountry && Platform.OS == 'ios') {
      Country.getDeviceCountry().then((res) => resolve(getCountryObj(res)));
    }
    else if (Country?.getCurrentCountry && Platform.OS == 'android') {
      Country.getCurrentCountry().then((res) => resolve(getCountryObj(res)));
    }
  });

  // (getDeviceCountry, countryCode: (RCTPromiseResolveBlock)code)

  // Country.getDeviceCountry().then((res) => alert(res));


  // return new Promise((res) => {
  //   setTimeout(() => {
  //     res("US")
  //   }, 1000);
  // });
  // return Country.getCurrentCountry();
}


const getCountryObj = (key) => {
  if (key && key != '') {
    return countries[String(key).toUpperCase()];
  }
  return null
}