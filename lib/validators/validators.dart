class Validators {
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (value.length != 11) {
      return 'رقم الهاتف يجب أن يتكون 11 أرقام';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال كلمة السر';
    }
    if (value.length < 6) {
      return 'كلمة السر يجب أن تتكون من 6 أحرف على الأقل';
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال كلمة السر';
    }
    if (value != password) {
      return 'كلمة السر غير متطابقة';
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
        return 'الرجاء إدخال البيانات';
      }
      return null;
    }
    if (int.tryParse(value) == null) {
      return 'الرجاء إدخال رقم';
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
}

// extension KeyGetValue on GlobalKey<FormFieldState> {
//   String get value {
//     if (currentState == null) return "";
//     return currentState!.value.toString();
//   }
// }
