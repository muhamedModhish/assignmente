class Product {
  final int id, price;
  final String title, subTitle, description, image;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
  });
}

List<Product> products = [
  Product(
    id: 1,
    price: 1099,
    title: "جهاز موبايل",
    subTitle: "خفيف الوزن وقوي",
    description: " خفيف الوزن مع عمر بطارية طويل وأداء سريع.",
    image: "images/phone.jpg",
  ),

  Product(
    id: 2,
    price: 500,
    title: "سماعات",
    subTitle: "إلغاء الضوضاء",
    description: "سماعات إلغاء الضوضاء مع جودة صوت ممتازة وراحة.",
    image: "images/hedest.jpg",
  ),
  Product(
    id: 3,
    price: 62,
    title: "مسجل صوت",
    subTitle: "سجل اللحظات المهمة حولك",
    description: "مسجل صوت عالي الجودة لتسجيل اللحظات المهمة حولك.",
    image: "images/speker.jpg",
  ),
  Product(
    id: 4,
    price: 299,
    title: "كاميرا",
    subTitle: "التقاط اللحظات الثمينة",
    description: "كاميرا عالية الجودة لالتقاط اللحظات الثمينة في حياتك.",
    image: "images/camera.jpg",
  ),
  Product(
    id: 5,
    price: 199,
    title: "كاميرا كمبيوتر",
    subTitle: " واضح ومريح",
    description:
        "كاميرا كمبيوتر عالي الأداء لالتقاط الصور والفيديو بجودة عالية.",
    image: "images/cameracom.jpg",
  ),
  Product(
    id: 6,
    price: 89,
    title: "سماعات ثلاثية الأبعاد",
    subTitle: "صوت واضح ومريح",
    description:
        "سماعات ثلاثية الأبعاد عالية الجودة لتجربة صوت واضحة ومريحة أثناء الاستماع إلى الموسيقى أو المكالمات.",
    image: "images/hedest3.jpg",
  ),
];
