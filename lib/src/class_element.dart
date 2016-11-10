part of jaguar.generator.internal.element;

class ClassElementWrap implements NamedElement {
  final ClassElement _wrapped;

  ClassElementWrap(this._wrapped);

  String get name => _wrapped.name;

  String get libraryName => _wrapped.library.name;

  List<InterfaceTypeWrap> get allSupertypes => _wrapped.allSupertypes
      .map((InterfaceType iface) => new InterfaceTypeWrap(iface))
      .toList();

  bool isSameAs(ClassElementWrap other) {
    return name == other.name && libraryName == other.libraryName;
  }

  bool compareNames(NamedElement first) {
    return first.name == name && first.libraryName == libraryName;
  }

  List<FieldElement> get fields => _wrapped.fields;

  Iterable<AnnotationElementWrap> get metadata =>
      _wrapped.metadata.map((annot) => new AnnotationElementWrap(annot));

  List<TypeParameterElement> get typeParameters => _wrapped.typeParameters;

  bool isSubtypeOf(NamedElement named) {
    for (InterfaceTypeWrap interface in allSupertypes) {
      if (interface.isSame(named)) {
        return true;
      }
    }

    return false;
  }

  InterfaceTypeWrap getSubtypeOf(NamedElement named) {
    for (InterfaceTypeWrap interface in allSupertypes) {
      if (interface.isSame(named)) {
        return interface;
      }
    }

    return null;
  }
}
