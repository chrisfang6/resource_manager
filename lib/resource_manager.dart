library resource_manager;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:resource_manager/resources.dart';

const _prefixDimen = "@dimen/";
const _prefixColor = "@color/";
const _prefixDrawable = "@drawable/";
const _prefixString = "@string/";
const _prefixInteger = "@integer/";
const _prefixDouble = "@double/";

double _devicePixelRatio;
Resources _resources;

Future initBaseResources(
    double devicePixelRatio, String baseResourceFile) async {
  setDevicePixelRatio(devicePixelRatio);
  _setResources(Resources.fromJson(
      json.decode(await rootBundle.loadString(baseResourceFile))
          as Map<String, dynamic>));
}

Future<Resources> getResources(String jsonFile) async => Resources.fromJson(
    json.decode(await rootBundle.loadString(jsonFile)) as Map<String, dynamic>);

void setDevicePixelRatio(double devicePixelRatio) {
  _devicePixelRatio = devicePixelRatio;
}

void _setResources(Resources resources) {
  _resources = resources;
}

int _dpToPxWithDensity(num dp) =>
    (dp * _devicePixelRatio + (dp >= 0 ? 0.5 : (-0.5))).round();

int _pxToDpWithDensity(num px) =>
    (px / _devicePixelRatio + (px >= 0 ? 0.5 : (-0.5))).round();

/// The logic pixel by named key. Same as getDimensionPixelOffset().
double getDimension(String name,
    {Resources fromResources, Set<String> soughtNames}) {
  String prefix = _prefixDimen;
  dynamic value =
      (fromResources?.dimens != null ? fromResources.dimens[name] : null) ??
          (_resources?.dimens != null ? _resources.dimens[name] : null);
  if (value is! String) {
    return 0.0;
  }
  if (RegExp(r"^-{0,1}\d+(dp|sp)$").hasMatch(value)) {
    // dp or sp
    return int.tryParse(RegExp(r"-{0,1}\d+").firstMatch(value).group(0))
            ?.toDouble() ??
        0.0;
  } else if (RegExp(r"^-{0,1}\d+px$").hasMatch(value)) {
    // px
    return _pxToDpWithDensity(
      int.tryParse(RegExp(r"-{0,1}\d+").firstMatch(value).group(0)) ?? 0,
    ).toDouble();
  } else if (RegExp(r"^" + "$prefix").hasMatch(value) &&
      fromResources != null &&
      fromResources != _resources) {
    String referName = value.substring(prefix.length);
    soughtNames ??= Set<String>();
    soughtNames.add(name);
    if (!soughtNames.contains(referName)) {
      soughtNames.add(referName);
      return getDimension(
        referName,
        fromResources: fromResources,
        soughtNames: soughtNames,
      );
    } else if (_notBaseResources(fromResources)) {
      // The name has been sought in current resource file,
      // If the current resource is not the base resource,
      // seek the base resource.
      soughtNames.clear();
      return getDimension(
        referName,
        soughtNames: soughtNames,
      );
    }
  }
  return 0.0;
}

/// The Color by named key
int getColor(String name, {Resources fromResources, Set<String> soughtNames}) {
  String prefix = _prefixColor;
  dynamic value =
      (fromResources?.colors != null ? fromResources.colors[name] : null) ??
          (_resources?.colors != null ? _resources.colors[name] : null);
  if (value is! String) {
    return 0xffffffff;
  }
  if (value.startsWith('#')) {
    return int.tryParse('0x' + _validColor(value)) ?? 0;
  } else if (value.startsWith(prefix)) {
    String referName = value.substring(prefix.length);
    soughtNames ??= Set<String>();
    soughtNames.add(name);
    if (!soughtNames.contains(referName)) {
      soughtNames.add(referName);
      return getColor(
        referName,
        fromResources: fromResources,
        soughtNames: soughtNames,
      );
    } else if (_notBaseResources(fromResources)) {
      // The name has been sought in current resource file,
      // If the current resource is not the base resource,
      // seek the base resource.
      soughtNames.clear();
      return getColor(
        referName,
        soughtNames: soughtNames,
      );
    }
  }
  return 0xffffffff;
}

String _validColor(color) {
  String value = color.substring(1);
  if (value.length > 8) {
    value = value.substring(0, 8);
  }
  if (value.length < 8) {
    int less = 8 - value.length;
    for (int i = 0; i < less; i++) {
      value = 'f' + value;
    }
  }
  return value;
}

/// The Drawable by named key
String getDrawable(String name,
    {Resources fromResources, Set<String> soughtNames}) {
  String prefix = _prefixDrawable;
  dynamic value =
      (fromResources?.drawable != null ? fromResources.drawable[name] : null) ??
          (_resources?.drawable != null ? _resources.drawable[name] : null);
  if (value is! String) {
    return '';
  }
  if (value.startsWith(prefix)) {
    String referName = value.substring(prefix.length);
    soughtNames ??= Set<String>();
    soughtNames.add(name);
    if (!soughtNames.contains(referName)) {
      soughtNames.add(referName);
      return getDrawable(
        referName,
        fromResources: fromResources,
        soughtNames: soughtNames,
      );
    } else if (_notBaseResources(fromResources)) {
      // The name has been sought in current resource file,
      // If the current resource is not the base resource,
      // seek the base resource.
      soughtNames.clear();
      return getDrawable(
        referName,
        soughtNames: soughtNames,
      );
    }
  }
  return value;
}

/// The String by named key
String getString(String name,
    {Resources fromResources, Set<String> soughtNames}) {
  String prefix = _prefixString;
  dynamic value =
      (fromResources?.strings != null ? fromResources.strings[name] : null) ??
          (_resources?.strings != null ? _resources.strings[name] : null);
  if (value is! String) {
    return '';
  }
  if (value.startsWith(prefix)) {
    String referName = value.substring(prefix.length);
    soughtNames ??= Set<String>();
    soughtNames.add(name);
    if (!soughtNames.contains(referName)) {
      soughtNames.add(referName);
      return getString(
        referName,
        fromResources: fromResources,
        soughtNames: soughtNames,
      );
    } else if (_notBaseResources(fromResources)) {
      // The name has been sought in current resource file,
      // If the current resource is not the base resource,
      // seek the base resource.
      soughtNames.clear();
      return getString(
        referName,
        soughtNames: soughtNames,
      );
    }
  }
  return value;
}

/// The Integer by named key
int getInteger(String name,
    {Resources fromResources, Set<String> soughtNames}) {
  String prefix = _prefixInteger;
  dynamic value =
      (fromResources?.integers != null ? fromResources.integers[name] : null) ??
          (_resources?.integers != null ? _resources.integers[name] : null);
  // Found Number
  if (value is num) {
    return value.toInt();
  }
  if (value is String && value.startsWith(prefix)) {
    // Refer to other resource
    String referName = value.substring(prefix.length);
    soughtNames ??= Set<String>();
    soughtNames.add(name);
    if (!soughtNames.contains(referName)) {
      soughtNames.add(referName);
      return getInteger(
        referName,
        fromResources: fromResources,
        soughtNames: soughtNames,
      );
    } else if (_notBaseResources(fromResources)) {
      // The name has been sought in current resource file,
      // If the current resource is not the base resource,
      // seek the base resource.
      soughtNames.clear();
      return getInteger(
        referName,
        soughtNames: soughtNames,
      );
    }
  }
  return 0;
}

/// The Double by named key
double getDouble(String name,
    {Resources fromResources, Set<String> soughtNames}) {
  String prefix = _prefixDouble;
  dynamic value =
      (fromResources?.doubles != null ? fromResources.doubles[name] : null) ??
          (_resources?.doubles != null ? _resources.doubles[name] : null);
  if (value is String && value.startsWith(prefix)) {
    // Refer to other resource
    String referName = value.substring(prefix.length);
    soughtNames ??= Set<String>();
    soughtNames.add(name);
    if (!soughtNames.contains(referName)) {
      soughtNames.add(referName);
      return getDouble(
        referName,
        fromResources: fromResources,
        soughtNames: soughtNames,
      );
    } else if (_notBaseResources(fromResources)) {
      // The name has been sought in current resource file,
      // If the current resource is not the base resource,
      // seek the base resource.
      soughtNames.clear();
      return getDouble(
        referName,
        soughtNames: soughtNames,
      );
    }
  }
  if (value is num) {
    return value.toDouble();
  }
  return 0;
}

bool _notBaseResources(Resources fromResources) =>
    fromResources != null && fromResources != _resources;
