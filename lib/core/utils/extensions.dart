import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

extension StringExtension on String? {
  bool get isTextEmpty {
    if (this == null) return true;
    return this!.trim().isEmpty;
  }

  bool get isTextNotEmpty {
    if (this == null) return false;
    return this!.trim().isNotEmpty;
  }

  bool get isNetwork {
    if (this == null) return false;
    String _value = this!.trim();
    return _value.startsWith('http') || _value.startsWith('https');
  }

  bool get isAsset {
    if (this == null) return false;
    String _value = this!.trim();
    return _value.contains('asset');
  }

  bool get isImagePath {
    if (this == null) return false;
    String _value = (p.extension(this!) ?? '').trim();
    return _value == '.png' || _value == '.jpeg';
  }

  bool get isVideoPath {
    if (this == null) return false;
    String _value = (p.extension(this!) ?? '').trim();
    return _value == '.mp4';
  }

  bool get isAudioPath {
    if (this == null) return false;
    String _value = (p.extension(this!) ?? '').trim();
    return _value == '.mp3' || _value == '.audio';
  }
}

extension IterableExtension<E> on Iterable<E>? {
  bool get isListEmpty {
    if (this == null) return true;
    return this!.isEmpty;
  }

  bool get isListNotEmpty {
    if (this == null) return false;
    return this!.isNotEmpty;
  }
}

extension MapExtension<K, V> on Map<K, V>? {
  bool get isMapEmpty {
    if (this == null) return true;
    return this!.keys.isListEmpty;
  }

  bool get isMapNotEmpty {
    if (this == null) return false;
    return this!.keys.isListNotEmpty;
  }
}

extension DateTimeExtension on DateTime {
  DateTime applyTimeOfDay(TimeOfDay time) =>
      DateTime(year, month, day, time.hour, time.minute);
}
