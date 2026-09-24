class NameValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم كامل مطلوبة';
    }
    return null;
  }
}
