part of ose;

/// Uniforms are part of shader programs.
/// There are needed to keep data and can be used inside your shader logic.
class Uniform {
  static final Function eq = const ListEquality().equals;

  /// Uniform type.
  QualifierType _type;

  /// Uniform data.
  Float32List _storage;

  // Uniform state.
  QualifierState state;

  /// Uniform use array.
  bool _useArray;

  /// Uniform location.
  webGL.UniformLocation location;

  Uniform._internal(this._type, List storage, [bool isArray = false]) {
    if (storage != null) {
      storage = storage.map((v) {
        return double.parse((v ?? .0).toString());
      }).toList();
      _storage =
          (storage.length > 0) ? new Float32List.fromList(storage) : null;
    }
    _useArray = isArray;
    state = QualifierState.INITIALIZED;
  }

  /// b1
  factory Uniform.Bool1([bool b0]) =>
      new Uniform._internal(QualifierType.Bool1, [(b0) ? 1.0 : .0]);

  /// i1
  factory Uniform.Int1([int i0]) =>
      new Uniform._internal(QualifierType.Int1, [i0]);

  /// f1
  factory Uniform.Float1([double f0]) =>
      new Uniform._internal(QualifierType.Float1, [f0]);

  /// f2
  factory Uniform.Float2([double f0, double f1 = 0.0]) {
    return new Uniform._internal(QualifierType.Float2, [f0, f1]);
  }

  /// f3
  factory Uniform.Float3([double f0, double f1 = 0.0, double f2 = 0.0]) {
    return new Uniform._internal(QualifierType.Float3, [f0, f1, f2]);
  }

  /// f4
  factory Uniform.Float4(
      [double f0, double f1 = 0.0, double f2 = 0.0, double f3 = 0.0]) {
    return new Uniform._internal(QualifierType.Float4, [f0, f1, f2, f3]);
  }

  /// fv1
  factory Uniform.FloatArray1([List<double> data]) {
    return new Uniform._internal(QualifierType.Float1, data, true);
  }

  /// fv2
  factory Uniform.FloatArray2([List<double> data]) {
    return new Uniform._internal(QualifierType.Float2, data, true);
  }

  /// fv3
  factory Uniform.FloatArray3([List<double> data]) {
    return new Uniform._internal(QualifierType.Float3, data, true);
  }

  /// fv4
  factory Uniform.FloatArray4([List<double> data]) {
    return new Uniform._internal(QualifierType.Float4, data, true);
  }

  /// mf2v
  factory Uniform.Mat2([List<double> data]) {
    return new Uniform._internal(QualifierType.Mat2, data);
  }

  /// mf3v
  factory Uniform.Mat3([List<double> data]) {
    return new Uniform._internal(QualifierType.Mat3, data);
  }

  /// mf4v
  // factory Uniform.Mat4([List<double> data]) {
  //   return new Uniform._internal(QualifierType.Mat4, data);
  // }

  /// Update storage values.
  ///
  /// Use [update] if you want to change uniform's values.
  void update(dynamic value) {
    List storage;

    if (utils.isNumeric(value)) {
      storage = new Float32List.fromList([double.parse(value.toString())]);
    } else if (value is bool) {
      storage = new Float32List.fromList([(value) ? 1.0 : .0]);
    } else if (value is Vector || value is Matrix) {
      storage = new Float32List.fromList(value.storage);
    } else if (value is Float32List) {
      storage = new Float32List.fromList(value);
    } else if (value is Int8List) {
      storage = new Int8List.fromList(value);
    } else if (value is TypedIdentity) {
      storage = value.toTypeIdentity();
    } else {
      window.console.error("Can't update attribute by value ${value}");
      throw ArgumentError;
    }

    if (!eq(_storage, storage)) {
      state = QualifierState.CHANGED;
      _storage = storage;
    } else {
      state = QualifierState.CACHED;
    }
  }

  bool operator ==(Uniform another) {
    return eq(storage, another.storage) &&
        type == another.type &&
        state == another.state;
  }

  QualifierType get type => _type;

  List get storage => _storage;

  bool get useArray => _useArray;
}
