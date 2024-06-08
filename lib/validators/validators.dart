class Validators {
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'تکایە ژمارەی مۆبایل بنووسە';
    }
    if (value.length != 11) {
      return 'ژمارەی مۆبایل پێویستە لە ١١ پیت بێت';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'تکایە ژمارەی نهێنی بنووسە';
    }
    if (value.length < 6) {
      return 'ژمارەی نهێنی پێویستە لە ٦ پیت بێت';
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'تکایە ژمارەی نهێنی بنووسە';
    }
    if (value != password) {
      return 'ژمارەی نهێنی ناگونجاوە';
    }
    return null;
  }

  static String? text(
    String? value, {
    bool isRequired = true,
    int minLength = 0,
    int maxLength = 255,
  }) {
    if (value == null || value.isEmpty) {
      if (isRequired) {
        return 'الرجاء إدخال البيانات';
      }
      return null;
    }
    if (value.length < minLength) {
      return 'البيانات يجب أن تتكون من $minLength أحرف على الأقل';
    }
    if (value.length > maxLength) {
      return 'البيانات يجب أن تتكون من $maxLength أحرف على الأكثر';
    }
    return null;
  }

  static String? number(String? value, {bool isRequired = true}) {
    if (value == null || value.isEmpty) {
      if (isRequired) {
        return 'تکایە ژمارە بنووسە';
      }
      return null;
    }
    if (int.tryParse(value) == null) {
      return 'تکایە ژمارە بنووسە';
    }
    return null;
  }

  static String? note(
    String? value, {
    bool isRequired = true,
    int minLength = 0,
    int maxLength = 255,
  }) {
    if (value == null || value.isEmpty) {
      if (isRequired) {
        return 'تکایە تێبینیەکان بنووسە';
      }
      return null;
    }
    if (value.length < minLength) {
      return 'البيانات يجب أن تتكون من $minLength أحرف على الأقل';
    }
    if (value.length > maxLength) {
      return 'البيانات يجب أن تتكون من $maxLength أحرف على الأكثر';
    }
    return null;
  }
}

// extension KeyGetValue on GlobalKey<FormFieldState> {
//   String get value {
//     if (currentState == null) return "";
//     return currentState!.value.toString();
//   }
// }
