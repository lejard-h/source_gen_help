part of jaguar.generator.internal.element;

class ParameterElementWrap implements WithMetadata {
  final ParameterElement _wrapped;

  ParameterElementWrap(this._wrapped) {
    _wrapped.computeConstantValue();
    _type = new DartTypeWrap(_wrapped.type);
  }

  ParameterKind get parameterKind => _wrapped.parameterKind;

  DartTypeWrap _type;

  DartTypeWrap get type => _type;

  dynamic get toValueIfBuiltin {
    if (!_type.isBuiltin) {
      return null;
    }

    DartObject value = _wrapped.constantValue;

    if (value == null) {
      return null;
    }

    if (_type.isInt) {
      return value.toIntValue();
    } else if (_type.isDouble) {
      return value.toDoubleValue();
    } else if (_type.isNum) {
      return value.toDoubleValue();
    } else if (_type.isString) {
      return value.toStringValue();
    } else if (_type.isBool) {
      return value.toBoolValue();
    }

    return null;
  }

  String get name => _wrapped.name;

  String get sourceValue => _wrapped.toString();

  List<AnnotationElementWrap> get metadata => _wrapped.metadata
      .map((annot) => new AnnotationElementWrap(annot))
      .toList();
}
