part of jaguar.generator.internal.element;

abstract class WithMetadata {
  List<AnnotationElementWrap> get metadata;
}

class ClassElementWrap extends Object
    with NamedElement
    implements WithMetadata {
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

  List<FieldElement> get fiels => _wrapped.fields;

  List<PropertyAccessorElement> getAccessors({bool withSupertype: false}) {
    List<PropertyAccessorElement> access = new List.from(_wrapped.accessors);
    if (withSupertype == true) {
      for (InterfaceTypeWrap supertype in allSupertypes) {
        if (supertype.name != "Object") {
          //fixme: better way to do this ?
          access.addAll(supertype.accessors);
        }
      }
    }
    return access;
  }

  List<AnnotationElementWrap> get metadata => _wrapped.metadata
      .map((annot) => new AnnotationElementWrap(annot))
      .toList();

  List<TypeParameterElement> get typeParameters => _wrapped.typeParameters;

  bool isSubtypeOf(NamedElement type) => allSupertypes
      .any((InterfaceTypeWrap inter) => inter.compareNamedElement(type));

  InterfaceTypeWrap getSubtypeOf(NamedElement named) {
    for (InterfaceTypeWrap interface in allSupertypes) {
      if (interface.compareNamedElement(named)) {
        return interface;
      }
    }

    return null;
  }

  List<MethodElementWrap> get methods =>
      _wrapped.methods.map((meth) => new MethodElementWrap(meth)).toList();

  ConstructorElementWrap get unnamedConstructor =>
      new ConstructorElementWrap(_wrapped.unnamedConstructor);

  ConstructorElementWrap getNamedConstructors(String name) {
    ConstructorElement el = _wrapped.getNamedConstructor(name);
    if (el == null) {
      return null;
    }
    return new ConstructorElementWrap(el);
  }
}
