class HomeItemModel {
  HomeItemModel({
    required this.content,
    required this.status,
  });
  late final Content content;
  late final bool status;
  
  HomeItemModel.fromJson(Map<String, dynamic> json){
    content = Content.fromJson(json['content']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.toJson();
    _data['status'] = status;
    return _data;
  }
}

class Content {
  Content({
    required this.data,
    required this.meta,
  });
  late final List<Data> data;
  late final Meta meta;
  
  Content.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['meta'] = meta.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
  });
  late final int id;
  late final String title;
  late final String description;
  late final String bannerImage;
  late final String dateTime;
  late final String organiserName;
  late final String organiserIcon;
  late final String venueName;
  late final String venueCity;
  late final String venueCountry;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    bannerImage = json['banner_image'];
    dateTime = json['date_time'];
    organiserName = json['organiser_name'];
    organiserIcon = json['organiser_icon'];
    venueName = json['venue_name'];
    venueCity = json['venue_city'];
    venueCountry = json['venue_country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['banner_image'] = bannerImage;
    _data['date_time'] = dateTime;
    _data['organiser_name'] = organiserName;
    _data['organiser_icon'] = organiserIcon;
    _data['venue_name'] = venueName;
    _data['venue_city'] = venueCity;
    _data['venue_country'] = venueCountry;
    return _data;
  }
}

class Meta {
  Meta({
    required this.total,
  });
  late final int total;
  
  Meta.fromJson(Map<String, dynamic> json){
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    return _data;
  }
}


class customDate{

  String ?day;
  String ?month;
  String ?date;
  String ?year;
  String ?time;
  customDate({this.date, this.day , this.month, this.time, this.year});
}