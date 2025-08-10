enum CreateUserError {
  emailAlreadyInUse('email-already-in-use'),
  invalidEmail('invalid-email'),
  weakPassword('weak-password'),
  tooManyRequests('too-many-requests'),
  userTokenExpired('user-token-expired'),
  networkRequestFailed('network-request-failed'),
  operationNotAllowed('operation-not-allowed'),
  unknown('unknown');

  const CreateUserError(this.code);
  factory CreateUserError.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return CreateUserError.emailAlreadyInUse;
      case 'invalid-email':
        return CreateUserError.invalidEmail;
      case 'weak-password':
        return CreateUserError.weakPassword;
      case 'too-many-requests':
        return CreateUserError.tooManyRequests;
      case 'user-token-expired':
        return CreateUserError.userTokenExpired;
      case 'network-request-failed':
        return CreateUserError.networkRequestFailed;
      case 'operation-not-allowed':
        return CreateUserError.operationNotAllowed;
      default:
        return CreateUserError.unknown;
    }
  }
  final String code;
}

extension CreateUserErrorExtension on CreateUserError {
  String get message {
    switch (this) {
      case CreateUserError.emailAlreadyInUse:
        return 'The account already exists for that email.';
      case CreateUserError.invalidEmail:
        return 'The email address is not valid.';
      case CreateUserError.weakPassword:
        return 'The password provided is too weak.';
      case CreateUserError.tooManyRequests:
        return 'Too many requests, please try again later.';
      case CreateUserError.userTokenExpired:
        return 'Your session has expired, please log in again.';
      case CreateUserError.networkRequestFailed:
        return 'Network request failed, please check your internet connection.';
      case CreateUserError.operationNotAllowed:
      case CreateUserError.unknown:
        return 'An unknown error occurred.';
    }
  }
}

enum LoginError {
  invalidEmail('invalid-email'),
  userDisabled('user-disabled'),
  userNotFound('user-not-found'),
  wrongPassword('wrong-password'),
  tooManyRequests('too-many-requests'),
  userTokenExpired('user-token-expired'),
  networkRequestFailed('network-request-failed'),
  invalidCredential('invalid-credential'),
  operationNotAllowed('operation-not-allowed'),
  unknown('unknown');

  const LoginError(this.code);
  factory LoginError.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return LoginError.invalidEmail;
      case 'user-disabled':
        return LoginError.userDisabled;
      case 'user-not-found':
        return LoginError.userNotFound;
      case 'wrong-password':
        return LoginError.wrongPassword;
      case 'too-many-requests':
        return LoginError.tooManyRequests;
      case 'user-token-expired':
        return LoginError.userTokenExpired;
      case 'network-request-failed':
        return LoginError.networkRequestFailed;
      case 'invalid-credential':
        return LoginError.invalidCredential;
      case 'operation-not-allowed':
        return LoginError.operationNotAllowed;
      default:
        return LoginError.unknown;
    }
  }
  final String code;
}

extension LoginErrorExtension on LoginError {
  String get message {
    switch (this) {
      case LoginError.invalidEmail:
        return 'The email address is not valid.';
      case LoginError.userDisabled:
        return 'The user account has been disabled.';
      case LoginError.userNotFound:
        return 'No user found with that email.';
      case LoginError.wrongPassword:
        return 'Wrong password provided for that user.';
      case LoginError.tooManyRequests:
        return 'Too many requests, please try again later.';
      case LoginError.userTokenExpired:
        return 'Your session has expired, please log in again.';
      case LoginError.networkRequestFailed:
        return 'Network request failed, please check your internet connection.';
      case LoginError.invalidCredential:
        return 'Invalid login credentials.';
      case LoginError.operationNotAllowed:
      case LoginError.unknown:
        return 'An unknown error occurred.';
    }
  }
}

enum SendPasswordResetEmailError {
  missingAndroiodPkgName('auth/missing-android-pkg-name'),
  missingContinueUri('auth/missing-continue-uri'),
  missingIosBundleId('auth/missing-ios-bundle-id'),
  invalidContinueUri('auth/invalid-continue-uri'),
  unauthorizedContinueUri('auth/unauthorized-continue-uri'),
  userNotFound('auth/user-not-found'),
  unknown('unknown');

  const SendPasswordResetEmailError(this.code);
  factory SendPasswordResetEmailError.fromCode(String code) {
    switch (code) {
      case 'auth/missing-android-pkg-name':
        return SendPasswordResetEmailError.missingAndroiodPkgName;
      case 'auth/missing-continue-uri':
        return SendPasswordResetEmailError.missingContinueUri;
      case 'auth/missing-ios-bundle-id':
        return SendPasswordResetEmailError.missingIosBundleId;
      case 'auth/invalid-continue-uri':
        return SendPasswordResetEmailError.invalidContinueUri;
      case 'auth/unauthorized-continue-uri':
        return SendPasswordResetEmailError.unauthorizedContinueUri;
      case 'auth/user-not-found':
        return SendPasswordResetEmailError.userNotFound;
      default:
        return SendPasswordResetEmailError.unknown;
    }
  }
  final String code;
}

extension SendPasswordResetEmailErrorExtension on SendPasswordResetEmailError {
  String get message {
    switch (this) {
      case SendPasswordResetEmailError.missingAndroiodPkgName:
        return 'Missing Android package name.';
      case SendPasswordResetEmailError.missingContinueUri:
        return 'Missing continue URI.';
      case SendPasswordResetEmailError.missingIosBundleId:
        return 'Missing iOS bundle ID.';
      case SendPasswordResetEmailError.invalidContinueUri:
        return 'Invalid continue URI.';
      case SendPasswordResetEmailError.unauthorizedContinueUri:
        return 'Unauthorized continue URI.';
      case SendPasswordResetEmailError.userNotFound:
        return 'No user found with that email.';
      case SendPasswordResetEmailError.unknown:
        return 'An unknown error occurred.';
    }
  }
}

enum ConfirmResetPasswordError {
  invalidActionCode('invalid-action-code'),
  expiredActionCode('expired-action-code'),
  userDisabled('user-disabled'),
  userNotFound('user-not-found'),
  weakPassword('weak-password'),
  unknown('unknown');

  const ConfirmResetPasswordError(this.code);
  factory ConfirmResetPasswordError.fromCode(String code) {
    switch (code) {
      case 'invalid-action-code':
        return ConfirmResetPasswordError.invalidActionCode;
      case 'expired-action-code':
        return ConfirmResetPasswordError.expiredActionCode;
      case 'user-disabled':
        return ConfirmResetPasswordError.userDisabled;
      case 'user-not-found':
        return ConfirmResetPasswordError.userNotFound;
      case 'weak-password':
        return ConfirmResetPasswordError.weakPassword;
      default:
        return ConfirmResetPasswordError.unknown;
    }
  }
  final String code;
}

extension ConfirmResetPasswordErrorExtension on ConfirmResetPasswordError {
  String get message {
    switch (this) {
      case ConfirmResetPasswordError.invalidActionCode:
        return 'The action code is invalid.';
      case ConfirmResetPasswordError.expiredActionCode:
        return 'The action code has expired.';
      case ConfirmResetPasswordError.userDisabled:
        return 'The user corresponding to the action code has been disabled.';
      case ConfirmResetPasswordError.userNotFound:
        return 'No user found corresponding to the action code.';
      case ConfirmResetPasswordError.weakPassword:
        return 'The new password is not strong enough.';
      case ConfirmResetPasswordError.unknown:
        return 'An unknown error occurred.';
    }
  }
}
