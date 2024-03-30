extension StringExtensions on String? {
  bool get isEmptyOrNull => this == null || this!.isEmpty;
  bool get isNotEmptyOrNull => !(this == null || this!.isEmpty);

  bool get isNullOrWhiteSpace {
    var length = (this?.split('') ?? []).where((x) => x == ' ').length;
    return length == (this?.length ?? 0) || isEmptyOrNull;
  }

  String toCapitalize() {
    return "${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}";
  }
}
