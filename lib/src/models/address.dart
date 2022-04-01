part of openid_flutter.models;

class Address extends JsonObject {
  /// Full mailing address, formatted for display or use on a mailing label.
  String? get formatted => this['formatted'];

  /// Full street address component.
  String? get streetAddress => this['street_address'];

  /// City or locality component.
  String? get locality => this['locality'];

  /// State, province, prefecture, or region component.
  String? get region => this['region'];

  /// Zip code or postal code component.
  String? get postalCode => this['postal_code'];

  /// Country name component.
  String? get country => this['country'];

  Address.fromJson(Map<String, dynamic> json) : super.from(json);
}
