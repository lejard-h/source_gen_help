part of jaguar.generator.internal.element;

class MethodElementWrap implements WithMetadata {
  MethodElementWrap(this._wrapped) {
    for (ParameterElementWrap param in parameters) {
      if (param.parameterKind.isOptional) {
        _optionalParams.add(param);

        _areOptionalParamsPositional =
            param.parameterKind == ParameterKind.POSITIONAL;
      } else {
        _requiredParams.add(param);
      }
    }
  }

  final MethodElement _wrapped;

  bool get isStatic => _wrapped.isStatic;

  List<AnnotationElementWrap> get metadata =>
      _wrapped.metadata.map((el) => new AnnotationElementWrap(el)).toList();

  final List<ParameterElementWrap> _requiredParams = <ParameterElementWrap>[];

  final List<ParameterElementWrap> _optionalParams = <ParameterElementWrap>[];

  bool _areOptionalParamsPositional = false;

  String get prototype {
    StringBuffer sb = new StringBuffer();
    sb.write(returnType.toString() + " ");
    sb.write(name + "(");

    if (_requiredParams.length != 0) {
      String paramsStr = _requiredParams
          .map((ParameterElementWrap pel) => pel.sourceValue)
          .join(",");

      sb.write(paramsStr);

      if (_optionalParams.length != 0) {
        sb.write(',');
      }
    }

    if (_optionalParams.length != 0) {
      if (_areOptionalParamsPositional) {
        sb.write('[');
      } else {
        sb.write('{');
      }

      String paramsStr = _optionalParams.map((ParameterElementWrap pel) {
        final str = pel.sourceValue;
        return str.substring(1, str.length - 1);
      }).join(",");

      sb.write(paramsStr);

      if (_areOptionalParamsPositional) {
        sb.write(']');
      } else {
        sb.write('}');
      }
    }

    sb.writeln(");");
    return sb.toString();
  }

  String get name => _wrapped.name;

  List<ParameterElementWrap> get parameters => _wrapped.parameters
      .map((param) => new ParameterElementWrap(param))
      .toList();

  List<ParameterElementWrap> get requiredParameters => _requiredParams;

  List<ParameterElementWrap> get optionalParameters => _optionalParams;

  bool get areOptionalParamsPositional => _areOptionalParamsPositional;

  DartTypeWrap get returnType => new DartTypeWrap(_wrapped.returnType);

  DartTypeWrap get returnTypeWithoutFuture => returnType.flattenFuture;
}

abstract class MethodReturnTypeMixin {
  MethodElementWrap get method;

  DartTypeWrap get returnType => method.returnType;

  DartTypeWrap get returnsFutureFlattened => method.returnTypeWithoutFuture;
}
