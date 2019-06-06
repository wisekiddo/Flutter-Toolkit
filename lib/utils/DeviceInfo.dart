import 'dart:async';

import 'package:device_info/device_info.dart';

class Specification {
    String model;
    String device;
    String manufacturer;

    Specification(this.model, this.device, this.manufacturer);
}

class DeviceInfo{

    static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();


    static Future<Specification> getInformation() async {

        Specification spec;

        try {
            AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
            spec = Specification(androidInfo.model, androidInfo.device, androidInfo.manufacturer);
        } catch (e) {
            // Handle error...
        }

        try {
            IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
            spec = Specification(iosInfo.model, iosInfo.localizedModel, "Apple");

        }catch (e) {
            // Handle error...
        }

        return spec;
    }



}