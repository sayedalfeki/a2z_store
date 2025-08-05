class AppValidation
{
  static String? validateEmail(String? email)
  {
    if(email!.isEmpty)
    {
      return 'you must enter email';
    }
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email))
    {
      return 'you must enter a valid email';
    }
    return null;
  }
  static String? validatePassword(String? password)
  {
    if(password!.isEmpty)
    {
      return 'you must enter password';
    }
    // if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
    //     .hasMatch(password))
    // {
    //   return 'password must contain letters, numbers and spacial character';
    // }
    return null;
  }
  static String? validateConfirmPassword(String? value,String password )
  {
    if(value!.isEmpty)
    {
      return 'you must enter a value';
    }
    if(value!=password)
    {
      return 'password doesnt match';
    }
    // if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
    //     .hasMatch(password))
    // {
    //   return 'password must contain letters, numbers and spacial character';
    // }
    return null;
  }
  static String? validateText(String? text)
  {
    if(text!.isEmpty)
    {
      return 'enter a value';
    }

    return null;
  }
  static String? validatePhone(String? phone)
  {
    if(phone!.isEmpty)
    {
      return 'you must enter phone';
    }
    if(!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
        .hasMatch(phone))
    {
      return 'enter a valid phone number';
    }
    return null;
  }
}