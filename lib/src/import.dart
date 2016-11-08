library jaguar.generator.internal.element;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:analyzer/src/generated/utilities_dart.dart';
import 'package:source_gen/src/annotation.dart';

part 'constructor_element.dart';
part 'method_element.dart';
part 'dart_type.dart';
part 'parameter_element.dart';
part 'annotation_element.dart';
part 'class_element.dart';

/// An element that has a name and library
abstract class NamedElement {
  /// Name of the element
  String get name;

  /// Library the element is in
  String get libraryName;
}

/// An element that has a name and library
class NamedElementImpl implements NamedElement {
  /// Name of the element
  final String name;

  /// Library the element is in
  final String libraryName;

  const NamedElementImpl.Make(this.name, this.libraryName);

  bool compareNamedElement(NamedElement other) {
    return name == other.name && libraryName == other.libraryName;
  }
}