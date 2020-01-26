class Article {
  int articleId;
  String title;
  String description;
  String imageUrl;
  String category;

  Article({
    this.articleId,
    this.title,
    this.imageUrl,
    this.description,
    this.category,
  });
}

List<Article> articles = <Article>[
  Article(
      articleId: 1,
      title: "Getting to the Bottom of Navigation in Flutter",
      category: "FLutter",
      description:
          "Bottom navigation in mobile apps is popular because our phones keep getting bigger but our thumbs do not. The Material Design specification describes a bottom navigation bar as a row of three to five buttons at the",
      imageUrl:
          "https://miro.medium.com/max/1524/1*pzfLG6bpSs8KGe48AXZR_g.png"),
  Article(
      articleId: 2,
      title: "India’s economy risks swapping stagnation for stagflation",
      category: "Economy",
      description:
          "The hawkers had some plausible excuses. The weather has been erratic, and delivery systems unreliable. But although an increase in inflation was widely foreseen, the severity of it was not. Consumer prices rose by over 7.3% i",
      imageUrl:
          "https://www.economist.com/img/b/1000/563/85/sites/default/files/20200125_FNP501.jpg"),
  Article(
      articleId: 3,
      title: "5 Mistakes That Could Ruin Your Content Marketing Campaign",
      category: "Marketing",
      description:
          "However, making it work is not easy. Some businesses fail because of silly mistakes such as misconceptions about what content marketing really is and isn’t. For example, they think of content marketing as something that doesn’t require a lot of investments and ultimately fail because of boring, mediocre content.",
      imageUrl:
          "https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMDk2Mn0"),
  Article(
      articleId: 4,
      title: "What's the Best Way to Leash Your Dog?",
      category: "Lifestyle",
      description:
          "Awe ... You got a puppy. Bet you're looking forward to lots of fun days playing with her, taking walks. Feeding her, teaching her to roll over, taking walks. Cuddling on the couch with her and, yes, taking walks. Are you sensing a theme?",
      imageUrl: "https://resize.hswstatic.com/w_907/gif/dog-leash.jpg"),
  Article(
      articleId: 5,
      title: "Party Makeup",
      category: "Beauty",
      description:
          "Who doesn't enjoy getting dolled up for a party? It's a great opportunity to go all out and look your absolute best! You can stun them with some wild and flashy makeup, adding sparkles and bold colors that are just perfect for parties.",
      imageUrl: "https://www.beautytipsonline.com/images/eye-makeup.jpg"),
  Article(
      articleId: 5,
      title:
          "One of the World’s Most Dangerous Spiders Could Invade Homes after Australia's Recent Rainfall",
      category: "Environment",
      description:
          "While recent rainfall has been a welcome change in Australia after destructive bushfires caused a widespread crisis, it hasn’t come without an asterisk. According to the Australian Reptile Park, the wet and warm conditions have made Sydney funnel web spiders highly active—and the funnel",
      imageUrl:
          "https://images2.minutemediacdn.com/image/upload/c_crop,h_1124,w_2000,x_0,y_67/f_auto,q_auto,w_1100/v1579797307/shape/mentalfloss/613403-ianwaldie-gettyimages-56714645.jpg"),
];
