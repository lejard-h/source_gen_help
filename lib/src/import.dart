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
part 'interface_type_element.dart';

/// An element that has a name and library
abstract class NamedElement {
  /// Name of the element
  String get name;

  /// Library the element is in
  String get libraryName;

  bool compareNamedElement(NamedElement other) {
    return name == other.name && libraryName == other.libraryName;
  }

  static const String kCoreLibraryName = 'dart.core';

  static const String kTypeNameInt = 'int';

  static const String kTypeNameDouble = 'double';

  static const String kTypeNameNum = 'num';

  static const String kTypeNameBool = 'bool';

  static const String kTypeNameString = 'String';

  static const String kTypeNameDateTime = 'DateTime';

  static const String kTypeNameList = 'List';

  static const String kTypeNameMap = 'Map';

  static const NamedElement kTypeInt =
      const NamedElementImpl.Make(kTypeNameInt, kCoreLibraryName);

  static const NamedElement kTypeDouble =
      const NamedElementImpl.Make(kTypeNameDouble, kCoreLibraryName);

  static const NamedElement kTypeNum =
      const NamedElementImpl.Make(kTypeNameNum, kCoreLibraryName);

  static const NamedElement kTypeBool =
      const NamedElementImpl.Make(kTypeNameBool, kCoreLibraryName);

  static const NamedElement kTypeString =
      const NamedElementImpl.Make(kTypeNameString, kCoreLibraryName);

  static const NamedElement kTypeDateTime =
      const NamedElementImpl.Make(kTypeNameDateTime, kCoreLibraryName);

  static const NamedElement kTypeList =
      const NamedElementImpl.Make(kTypeNameList, kCoreLibraryName);

  static const NamedElement kTypeMap =
      const NamedElementImpl.Make(kTypeNameMap, kCoreLibraryName);
}

/// An element that has a name and library
class NamedElementImpl implements NamedElement {
  /// Name of the element
  final String name;

  /// Library the element is in
  final String libraryName;

  const NamedElementImpl.Make(this.name, this.libraryName);

  @override
  bool compareNamedElement(NamedElement other) {
    return name == other.name && libraryName == other.libraryName;
  }
}
