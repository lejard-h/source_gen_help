part of jaguar.generator.internal.element;

class InterfaceTypeWrap extends Object with NamedElement {
  final InterfaceType _wrapped;

  InterfaceTypeWrap(this._wrapped);

  String get name => _wrapped.name;

  String get libraryName => _wrapped.element.library.name;

  List<DartTypeWrap> get typeArguments =>
      _wrapped.typeArguments.map((arg) => new DartTypeWrap(arg)).toList();

  List<TypeParameterElement> get typeParameters => _wrapped.typeParameters;
}
