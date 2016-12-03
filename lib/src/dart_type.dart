part of jaguar.generator.internal.element;

class DartTypeWrap extends Object with NamedElement {
  final DartType _wrapped;

  DartTypeWrap(this._wrapped);

  bool get isVoid => _wrapped.isVoid;

  bool get isAsync => _wrapped.isDartAsyncFuture;

  bool get isDynamic => _wrapped.isDynamic;

  bool get isObject => _wrapped.isObject;

  bool get isInt => compareNamedElement(NamedElement.kTypeInt);

  bool get isDouble => compareNamedElement(NamedElement.kTypeDouble);

  bool get isNum => compareNamedElement(NamedElement.kTypeNum);

  bool get isBool => compareNamedElement(NamedElement.kTypeBool);

  bool get isString => compareNamedElement(NamedElement.kTypeString);

  bool get isBuiltin => isInt || isDouble || isNum || isBool || isString;

  bool get isDateTime => compareNamedElement(NamedElement.kTypeDateTime);

  bool get isList => compareNamedElement(NamedElement.kTypeList);

  bool get isMap => compareNamedElement(NamedElement.kTypeMap);

  String get displayName => _wrapped.displayName;

  String get name => _wrapped.name;

  String get libraryName => _wrapped.element.library.name;

  bool isAssignableTo(DartTypeWrap type) =>
      _wrapped.isAssignableTo(type._wrapped);

  bool isType(DartTypeWrap other) {
    if (libraryName != other.libraryName) {
      return false;
    }

    if (name != other.name) {
      return false;
    }

    return true;
  }

  String toString() => _wrapped.toString();

  ClassElementWrap get clazz => new ClassElementWrap(_wrapped.element);

  InterfaceTypeWrap get interface =>
      new InterfaceTypeWrap(_wrapped as InterfaceType);

  List<DartTypeWrap> get typeArguments => interface.typeArguments;

  DartTypeWrap get flattenFuture {
    if (!isAsync) {
      return this;
    }

    return new DartTypeWrap(
        _wrapped.flattenFutures(_wrapped.element.context.typeSystem));
  }
}
