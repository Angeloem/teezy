class Geo {
  late final String lat;
  late final String lon;

  // create a Geo object from a map
  Geo.fromJSON(Map<String, dynamic> map) {
    lat = map['lat'];
    lon = map['lng'];
  }
}

class Address {
  late final String street;
  late final String suite;
  late final String city;
  late final String zipcode;

  late final Geo geo;

  Address.fromJson(Map<String, dynamic> map) {
    street = map['street'];
    suite = map['suite'];
    city = map['city'];
    zipcode = map['zipcode'];
    geo = Geo.fromJSON(map['geo'] as Map<String, dynamic>);
  }
}

class Company {
  late final String name;
  late final String catchPhrase;
  late final String bs;

  Company.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    catchPhrase = map['catchPhrase'];
    bs = map['bs'];
  }
}

class UserProfileModel {
  late int id;
  late String name;
  late String username;
  late String email;
  late String phone;
  late String website;
  late Address address;
  late Company company;

  UserProfileModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    username = map['username'];
    email = map['email'];
    phone = map['phone'];
    website = map['website'];
    address = Address.fromJson(map['address'] as Map<String, dynamic>);
    company = Company.fromJson(map['company'] as Map<String, dynamic>);
  }
}
