class Comment {
  int id;
  String author, comment, created;

//<editor-fold desc="Data Methods">

  Comment({
    required this.id,
    required this.author,
    required this.comment,
    required this.created,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          author == other.author &&
          comment == other.comment &&
          created == other.created);

  @override
  int get hashCode =>
      id.hashCode ^ author.hashCode ^ comment.hashCode ^ created.hashCode;

  @override
  String toString() {
    return 'Comments{' +
        ' id: $id,' +
        ' author: $author,' +
        ' comment: $comment,' +
        ' created: $created,' +
        '}';
  }

  Comment copyWith({
    int? id,
    String? author,
    String? comment,
    String? created,
  }) {
    return Comment(
      id: id ?? this.id,
      author: author ?? this.author,
      comment: comment ?? this.comment,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'author': this.author,
      'comment': this.comment,
      'created': this.created,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] as int,
      author: map['author'] as String,
      comment: map['comment'] as String,
      created: map['created'] as String,
    );
  }

//</editor-fold>
}

class TravelCard {
  int id, price, likes;
  int rating;
  String title, about;
  List<String> images = [];
  List<Comment> comments = [];

//<editor-fold desc="Data Methods">

  TravelCard({
    required this.id,
    required this.price,
    required this.rating,
    required this.likes,
    required this.title,
    required this.about,
    required this.images,
    required this.comments,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TravelCard &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          price == other.price &&
          rating == other.rating &&
          likes == other.likes &&
          title == other.title &&
          about == other.about &&
          images == other.images &&
          comments == other.comments);

  @override
  int get hashCode =>
      id.hashCode ^
      price.hashCode ^
      rating.hashCode ^
      likes.hashCode ^
      title.hashCode ^
      about.hashCode ^
      images.hashCode ^
      comments.hashCode;

  @override
  String toString() {
    return 'TravelCard{' +
        ' id: $id,' +
        ' price: $price,' +
        ' rating: $rating,' +
        ' likes: $likes,' +
        ' title: $title,' +
        ' about: $about,' +
        ' images: $images,' +
        ' comments: $comments,' +
        '}';
  }

  TravelCard copyWith({
    int? id,
    int? price,
    int? rating,
    int? likes,
    String? title,
    String? about,
    List<String>? images,
    List<Comment>? comments,
  }) {
    return TravelCard(
      id: id ?? this.id,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      likes: likes ?? this.likes,
      title: title ?? this.title,
      about: about ?? this.about,
      images: images ?? this.images,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'price': this.price,
      'rating': this.rating,
      'likes': this.likes,
      'title': this.title,
      'about': this.about,
      'images': this.images,
      'comments': this.comments,
    };
  }

  factory TravelCard.fromMap(Map<String, dynamic> map) {
    return TravelCard(
      id: map['id'] as int,
      price: map['price'] as int,
      rating: map['rating'] as int,
      likes: map['likes'] as int,
      title: map['title'] as String,
      about: map['about'] as String,
      images: map['images'] as List<String>,
      comments: map['comments'] as List<Comment>,
    );
  }

//</editor-fold>
}
