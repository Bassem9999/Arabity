class CarsModel{
  int? id;
  String?  brand;
  String? model;
  String? color;
  int? price;
  String? transimition;
  String? km;
  String? year;
  String? ownerId;
  String? name;
  String? phone;
  String? city;
  String? additions;
  String? info;
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;
  String? photo5;
  String? photo6;
  String? photo7;
  String? date;

  CarsModel({
    this.id,
    this.model,
    this.brand,
    this.color,
    this.price,
    this.transimition,
    this.km,
    this.year,
    this.name,
    this.phone,
    this.ownerId,
    this.city,
    this.additions,
    this.info,
    this.photo1,
    this.photo2,
    this.photo3,
    this.photo4,
    this.photo5,
    this.photo6,
    this.photo7,
    this.date
    });

    CarsModel.fromJson(Map json){
    id = json['id'];
    brand = json['brand'];
    model = json['model'];
    color = json['color'];
    price = json['price'];
    transimition = json['trans'];
    km = json['km'];
    year = json['year'];
    name = json['owner'];
    phone = json['phone'];
    ownerId = json['ownerId'];
    city = json['city'];
    additions = json['additions'];
    info = json['info'];
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo3 = json['photo3'];
    photo4 = json['photo4'];
    photo5 = json['photo5'];
    photo6 = json['photo6'];
    photo7 = json['photo7'];
    date = json['date'];
    }

    Map toJson(){
      return {
        'id' : id,
        'model' : model,
        'brand' : brand,
        'color' : color,
        'price' : price,
        'trans' : transimition,
        'km' : km,
        'year' :  year,
        'owner' : name,
        'phone' : phone,
        'ownerId' : ownerId,
        'city' :  city,
        'additions': additions,
        'info' : info,
        'photo1' : photo1,
        'photo2' : photo2,
        'photo3' : photo3,
        'photo4' : photo4,
        'photo5' : photo5,
        'photo6' : photo6,
        'photo7' : photo7,
        'date' :   date,
        };
    }


}