part of jaguar.generator.internal.element;

class AnnotationElementWrap {
  final ElementAnnotation _wrapped;

  AnnotationElementWrap(this._wrapped) {
    _wrapped.computeConstantValue();
  }

  DartObject get constantValue => _wrapped.constantValue;

  String get libraryName => constantValue.type.element.library.displayName;

  String get displayName => constantValue.type.displayName;

  String get instantiationString {
    String lRet = (_wrapped as ElementAnnotationImpl).annotationAst.toSource();
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
}