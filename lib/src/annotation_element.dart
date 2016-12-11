part of jaguar.generator.internal.element;

class AnnotationElementWrap extends NamedElement {
  final ElementAnnotationImpl _wrapped;

  AnnotationElementWrap(this._wrapped) {
    _wrapped.computeConstantValue();
  }

  DartObject get constantValue => _wrapped.constantValue;

  String get libraryName => constantValue.type.element.library.displayName;

  String get name => constantValue.type.displayName;

  Element get element => _wrapped.element;

  String get instantiationString {
    String lRet = _wrapped.annotationAst.toSource();
    lRet = lRet.substring(1);
    return lRet;
  }

  dynamic get instantiated {
    _wrapped.computeConstantValue();
    try {
      return instantiateAnnotation(_wrapped);
    } catch (e) {
      return null;
    }
  }

  dynamic get argumentAst => _wrapped.annotationAst.arguments.arguments;

  ClassElementWrap get ancestorClazz {
    Element ret =
        _wrapped.element.getAncestor((Element el) => el is ClassElement);

    if (ret == null) {
      return null;
    }

    return new ClassElementWrap(ret);
  }
}
