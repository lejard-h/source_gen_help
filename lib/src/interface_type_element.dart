part of jaguar.generator.internal.element;

class InterfaceTypeWrap implements NamedElement {
  final InterfaceType _wrapped;

  InterfaceTypeWrap(this._wrapped);

  String get name => _wrapped.name;

  String get libraryName => _wrapped.element.library.name;

  bool isSame(NamedElement el) {
    return name == el.name && libraryName == el.libraryName;
  }

  List<DartTypeWrap> get typeArguments =>
      _wrapped.typeArguments.map((arg) => new DartTypeWrap(arg)).toList();

  List<TypeParameterElement> get typeParameters => _wrapped.typeParameters;
}
