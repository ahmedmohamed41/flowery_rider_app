abstract class AppStrings {
  static const String appName = 'Flower App';

  //auth

  static const String login = 'Login';
  static const String noToken = 'noToken';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  static const String loginSuccessfully = 'Login Successfully';
  static const String email = 'Email';
  static const String emailKey = 'email';
  static const String token = 'token';
  static const String enterYourEmail = 'Enter your email';
  static const String enterTheName = 'Enter the name';
  static const String enterThePhoneNumber = 'Enter the phone Number';
  static const String password = 'Password';
  static const String passwordKey = 'password';
  static const String enterYourPassword = 'Enter your password';
  static const String rememberMe = 'Remember me';
  static const String forgetPassword = 'Forget Password?';
  static const String doNotHaveAnAccount = 'Don\'t have an account? ';
  static const String signUp = 'Sign up';
  static const String userName = 'User name';
  static const String enterYourUserName = 'Enter your user name';
  static const String firstName = 'First name';
  static const String hintFirstNameText = 'Enter first name';
  static const String lastName = 'Last name';
  static const String enterYourLastName = 'Enter last name';
  static const String enterPassword = 'Enter password';
  static const String confirmPassword = 'Confirm password';
  static const String phone = 'Phone Number';
  static const String enterPhoneNumber = 'Enter phone number';
  static const String gender = 'Gender';
  static const String femail = 'Femail';
  static const String male = 'Male';
  static const String creatingAnAccountYouAgreeToOur =
      'Creating an account, you agree to our';
  static const String termsAndConditions = 'Terms&Conditions';
  static const String signUpSuccessMessage = 'Sign up successfully';
  static const String enterEmail =
      'Please enter your email associated to your account';
  static const String alreadyHaveAnAccount = 'Already have an account?';
  static const String confirm = 'Confirm';
  static const String resend = 'Resend';
  static const String didNotReceiveCode = 'Didn\'t receive code?';
  static const String emailVerification = 'Email verification';
  static const String invalidCode = 'Invalid code';
  static const String enterCode =
      'Please enter your code that send to your \n email address';
  static const String verifyButton = 'Didn\'t receive code? ';
  static const String resendButton = 'Resend';
  static const String resetPassword = 'Reset password';
  static const String resetPasswordHint =
      'Password must not be empty and must contain \n 6 characters with upper case letter and one \n number at least ';
  static const String newPassword = 'New Password';

  //home

  static const String flowery = 'Flowery';
  static const String search = 'Search';
  static const String home = 'Home';
  static const String cart = 'Cart';
  static const String profile = 'Profile';

  //profile

  static const String language = 'Language';
  static const String aboutUs = 'About us';
  static const String changeLanguage = 'Change Language';
  static const String arabic = 'Arabic';
  static const String english = 'English';
  static const String update = 'Update';
  static const String change = 'Change';
  static const String currentPassword = 'Current password';
  static const String confirmLogout = 'Confirm logout!!';
  static const String cancel = 'Cancel';
  static const String loading = 'Loading';

  //server failure messages

  static const String errorMessage =
      'Something went wrong, please try again later';
  static const String serverConnTimeout = 'Connection timeout with API server';
  static const String serverSendTimeout = 'Send timeout with API server';
  static const String serverRecTimeout = 'Receive timeout with API server';
  static const String serverCertError = 'Bad certificate with API server';
  static const String serverCancel = 'Request to API server was cancelled';
  static const String serverConnError = 'There is Connection Error';
  static const String serverNoInternet = 'No Internet Connection';
  static const String serverInvalidCreds = 'Invalid email or password';
  static const String serverNotFound =
      'Opps there was an error, please try again';
  static const String serverInternalError =
      'Internal server error, please try again later';
  static const String serverDefaultError =
      'Opps there was an error, please try again';

  // Validator Messages

  static const String emailRequired = 'Email is required';
  static const String emailNotValid = 'This Email is not valid';
  static const String passwordRequired = 'Password is required';
  static const String passwordLength = 'Password must be at least 8 characters';
  static const String passwordInvalid =
      'password must contain upper and lowercase, number and symbol';
  static const String passwordNotMatched = 'Password not matched';
  static const String fieldRequired = 'This field is required';
  static const String nameLength = 'length must be at least 3 characters long';
  static const String nameOnlyLetters = 'must contain letters only';
  static const String nameNoSpaces = 'cannot contain spaces';
  static const String phoneRequired = 'Phone number is required';
  static const String phoneInvalid = 'Invalid Egyptian phone number';
}
