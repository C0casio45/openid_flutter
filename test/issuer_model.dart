class IssuerModel {
  late String name;
  late Uri document_discovery;

  IssuerModel(this.name, this.document_discovery);

  IssuerModel.google() {
    name = "google";
    document_discovery = Uri.parse("https://accounts.google.com/");
  }

  IssuerModel.facebook() {
    name = "facebook";
    document_discovery = Uri.parse("https://www.facebook.com/");
  }
}
