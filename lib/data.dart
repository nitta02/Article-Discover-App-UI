class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  bool isLiked = false;

  Article(
    this.title,
    this.image,
    this.comments,
    this.likes,
    this.isLiked,
    this.location,
    this.shares,
    this.author,
  );
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://fatstacksblog.com/wp-content/uploads/2019/11/Person-writing-article-nov26.jpg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa'),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://i1.wp.com/blogsmedia.lse.ac.uk/blogs.dir/9/files/2019/10/hands.jpg?ssl=1',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore'),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://blogsmedia.lse.ac.uk/blogs.dir/9/files/2018/02/headway-537308.jpg',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya'),
];
