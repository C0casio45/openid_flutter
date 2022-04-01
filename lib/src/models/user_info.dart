part of openid_flutter.models;

abstract class UserInfo implements JsonObject {
  /// Identifier for the End-User at the Issuer.
  String get subject => this['sub'];

  /// End-User's full name in displayable form including all name parts,
  /// possibly including titles and suffixes, ordered according to the
  /// End-User's locale and preferences.
  String? get name => this['name'];

  /// Given name(s) or first name(s) of the End-User.
  ///
  /// Note that in some cultures, people can have multiple given names; all can
  /// be present, with the names being separated by space characters.
  String? get givenName => this['given_name'];

  /// Surname(s) or last name(s) of the End-User.
  ///
  /// Note that in some cultures, people can have multiple family names or no
  /// family name; all can be present, with the names being separated by space
  /// characters.
  String? get familyName => this['family_name'];

  /// Middle name(s) of the End-User.
  ///
  /// Note that in some cultures, people can have multiple middle names; all can
  /// be present, with the names being separated by space characters. Also note
  /// that in some cultures, middle names are not used.
  String? get middleName => this['middle_name'];

  /// Casual name of the End-User that may or may not be the same as the
  /// given name.
  String? get nickname => this['nickname'];

  /// Shorthand name by which the End-User wishes to be referred to at the RP,
  /// such as janedoe or j.doe. T
  String? get preferredUsername => this['preferred_username'];

  /// URL of the End-User's profile page.
  Uri? get profile =>
      this['profile'] == null ? null : Uri.parse(this['profile']);

  /// URL of the End-User's profile picture.
  Uri? get picture =>
      this['picture'] == null ? null : Uri.parse(this['picture']);

  /// URL of the End-User's Web page or blog.
  Uri? get website =>
      this['website'] == null ? null : Uri.parse(this['website']);

  /// End-User's preferred e-mail address.
  String? get email => this['email'];

  /// `true` if the End-User's e-mail address has been verified.
  bool? get emailVerified => this['email_verified'];

  /// End-User's gender.
  ///
  /// Values defined by the specification are `female` and `male`. Other values
  /// MAY be used when neither of the defined values are applicable.
  String? get gender => this['gender'];

  /// End-User's birthday.
  ///
  /// Date represented as an ISO 8601:2004 [ISO8601‑2004] YYYY-MM-DD format.
  /// The year MAY be 0000, indicating that it is omitted. To represent only the
  /// year, YYYY format is allowed.
  String? get birthdate => this['birthdate'];

  /// The End-User's time zone.
  ///
  /// For example, Europe/Paris or America/Los_Angeles.
  String? get zoneinfo => this['zoneinfo'];

  /// End-User's locale.
  String? get locale => this['locale'];

  /// End-User's preferred telephone number.
  String? get phoneNumber => this['phone_number'];

  /// `true if the End-User's phone number has been verified`
  bool? get phoneNumberVerified => this['phone_number_verified'];

  /// End-User's preferred postal address.
  Address? get address =>
      this['address'] == null ? null : Address.fromJson(this['address']);

  /// Time the End-User's information was last updated.
  DateTime? get updatedAt => this['updated_at'] == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(this['updated_at'] * 1000);

  factory UserInfo.fromJson(Map<String, dynamic> json) = _UserInfoImpl.fromJson;
}

class _UserInfoImpl extends JsonObject with UserInfo {
  _UserInfoImpl.fromJson(Map<String, dynamic> json) : super.from(json);
}
