class AuthModel {
  AuthModel({
    this.instanceId,
    this.id,
    this.aud,
    this.role,
    this.email,
    this.encryptedPassword,
    this.emailConfirmedAt,
    this.invitedAt,
    this.confirmationToken,
    this.confirmationSentAt,
    this.recoveryToken,
    this.recoverySentAt,
    this.emailChangeTokenNew,
    this.emailChange,
    this.emailChangeSentAt,
    this.lastSignInAt,
    this.rawAppMetaData,
    this.rawUserMetaData,
    this.isSuperAdmin,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.phoneConfirmedAt,
    this.phoneChange,
    this.phoneChangeToken,
    this.phoneChangeSentAt,
    this.confirmedAt,
    this.emailChangeTokenCurrent,
    this.emailChangeConfirmStatus,
    this.bannedUntil,
    this.reauthenticationToken,
    this.reauthenticationSentAt,
    this.isSsoUser,
    this.deletedAt,
    this.isAnonymous,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        instanceId: json['instance_id'] as String?,
        id: json['id'] as String?,
        aud: json['aud'] as String?,
        role: json['role'] as String?,
        email: json['email'] as String?,
        encryptedPassword: json['encrypted_password'] as String?,
        emailConfirmedAt: json['email_confirmed_at'] as String?,
        invitedAt: json['invited_at'],
        confirmationToken: json['confirmation_token'] as String?,
        confirmationSentAt: json['confirmation_sent_at'],
        recoveryToken: json['recovery_token'] as String?,
        recoverySentAt: json['recovery_sent_at'],
        emailChangeTokenNew: json['email_change_token_new'] as String?,
        emailChange: json['email_change'] as String?,
        emailChangeSentAt: json['email_change_sent_at'],
        lastSignInAt: json['last_sign_in_at'],
        rawAppMetaData: json['raw_app_meta_data'] == null
            ? null
            : RawAppMetaData.fromJson(
                json['raw_app_meta_data'] as Map<String, dynamic>,
              ),
        rawUserMetaData: json['raw_user_meta_data'] == null
            ? null
            : RawUserMetaData.fromJson(
                json['raw_user_meta_data'] as Map<String, dynamic>,
              ),
        isSuperAdmin: json['is_super_admin'],
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        phone: json['phone'],
        phoneConfirmedAt: json['phone_confirmed_at'],
        phoneChange: json['phone_change'] as String?,
        phoneChangeToken: json['phone_change_token'] as String?,
        phoneChangeSentAt: json['phone_change_sent_at'],
        confirmedAt: json['confirmed_at'] as String?,
        emailChangeTokenCurrent: json['email_change_token_current'] as String?,
        emailChangeConfirmStatus: json['email_change_confirm_status'] as int?,
        bannedUntil: json['banned_until'],
        reauthenticationToken: json['reauthentication_token'] as String?,
        reauthenticationSentAt: json['reauthentication_sent_at'],
        isSsoUser: json['is_sso_user'] as bool?,
        deletedAt: json['deleted_at'],
        isAnonymous: json['is_anonymous'] as bool?,
      );

  final String? instanceId;
  final String? id;
  final String? aud;
  final String? role;
  final String? email;
  final String? encryptedPassword;
  final String? emailConfirmedAt;
  final dynamic invitedAt;
  final String? confirmationToken;
  final dynamic confirmationSentAt;
  final String? recoveryToken;
  final dynamic recoverySentAt;
  final String? emailChangeTokenNew;
  final String? emailChange;
  final dynamic emailChangeSentAt;
  final dynamic lastSignInAt;
  final RawAppMetaData? rawAppMetaData;
  final RawUserMetaData? rawUserMetaData;
  final dynamic isSuperAdmin;
  final String? createdAt;
  final String? updatedAt;
  final dynamic phone;
  final dynamic phoneConfirmedAt;
  final String? phoneChange;
  final String? phoneChangeToken;
  final dynamic phoneChangeSentAt;
  final String? confirmedAt;
  final String? emailChangeTokenCurrent;
  final int? emailChangeConfirmStatus;
  final dynamic bannedUntil;
  final String? reauthenticationToken;
  final dynamic reauthenticationSentAt;
  final bool? isSsoUser;
  final dynamic deletedAt;
  final bool? isAnonymous;

  Map<String, dynamic> toJson() => {
        'instance_id': instanceId,
        'id': id,
        'aud': aud,
        'role': role,
        'email': email,
        'encrypted_password': encryptedPassword,
        'email_confirmed_at': emailConfirmedAt,
        'invited_at': invitedAt,
        'confirmation_token': confirmationToken,
        'confirmation_sent_at': confirmationSentAt,
        'recovery_token': recoveryToken,
        'recovery_sent_at': recoverySentAt,
        'email_change_token_new': emailChangeTokenNew,
        'email_change': emailChange,
        'email_change_sent_at': emailChangeSentAt,
        'last_sign_in_at': lastSignInAt,
        'raw_app_meta_data': rawAppMetaData?.toJson(),
        'raw_user_meta_data': rawUserMetaData?.toJson(),
        'is_super_admin': isSuperAdmin,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'phone': phone,
        'phone_confirmed_at': phoneConfirmedAt,
        'phone_change': phoneChange,
        'phone_change_token': phoneChangeToken,
        'phone_change_sent_at': phoneChangeSentAt,
        'confirmed_at': confirmedAt,
        'email_change_token_current': emailChangeTokenCurrent,
        'email_change_confirm_status': emailChangeConfirmStatus,
        'banned_until': bannedUntil,
        'reauthentication_token': reauthenticationToken,
        'reauthentication_sent_at': reauthenticationSentAt,
        'is_sso_user': isSsoUser,
        'deleted_at': deletedAt,
        'is_anonymous': isAnonymous,
      };
}

class RawAppMetaData {
  RawAppMetaData({
    this.provider,
    this.providers,
  });

  factory RawAppMetaData.fromJson(Map<String, dynamic> json) => RawAppMetaData(
        provider: json['provider'] as String?,
        providers: json['providers'] == null
            ? []
            : List<String>.from(
                (json['providers'] as List<dynamic>).map((x) => x as String),
              ),
      );

  final String? provider;
  final List<String>? providers;

  Map<String, dynamic> toJson() => {
        'provider': provider,
        'providers': providers == null
            ? []
            : List<dynamic>.from(providers!.map((x) => x)),
      };
}

class RawUserMetaData {
  RawUserMetaData();

  factory RawUserMetaData.fromJson(Map<String, dynamic> json) =>
      RawUserMetaData();

  Map<String, dynamic> toJson() => {};
}
