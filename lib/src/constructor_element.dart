part of jaguar.generator.internal.element;

class ConstructorElementWrap implements WithMetadata {
  ConstructorElementWrap(this._wrapped) {
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

  final ConstructorElement _wrapped;

  List<AnnotationElementWrap> get metadata =>
      _wrapped.metadata.map((el) => new AnnotationElementWrap(el)).toList();

  final List<ParameterElementWrap> _requiredParams = <ParameterElementWrap>[];

  final List<ParameterElementWrap> _optionalParams = <ParameterElementWrap>[];

  bool _areOptionalParamsPositional = false;

  String get name => _wrapped.name;

  List<ParameterElementWrap> get parameters =>
      _wrapped.parameters.map((el) => new ParameterElementWrap(el)).toList();

  List<ParameterElementWrap> get requiredParameters => _requiredParams;

  List<ParameterElementWrap> get optionalParameters => _optionalParams;

  bool get areOptionalParamsPositional => _areOptionalParamsPositional;

  ParameterElementWrap findOptionalParamByName(String paramName) {
    for (ParameterElementWrap param in _optionalParams) {
      if (param.name == paramName) {
        return param;
      }
    }

    return null;
  }
}
