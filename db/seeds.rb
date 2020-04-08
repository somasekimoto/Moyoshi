# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  [
    {
      name: 'taro',
      email: 't1@taro.com',
      password: "taro123"

    },
    {
      name: 'jiro',
      email: 'te2@jiro.com',
      password: "jiro123"

    },
    {
      name: 'ichiro',
      email: 'tes3@ichiro.com',
      password: "ichiro1"
    },
    {
      name: 'saburo',
      email: 'test4@saburo.com',
      password: "saburo1"
    },
  ]
)

Post.create(
  [
    {
      title: "日曜、漁の手伝いしたい人？？",
      content: "日曜日の漁の手伝いしてくれる人募集してます。終了後、とれたての魚を調理して、召し上がってもらえます！気になった人ぜひいいね！",
      image: File.open('app/assets/images/net-fishing.jpeg'),
      user_id:1,
      likes_count: 0 
    },
    {
      title: "婚活パーティします！",
      content: "今週の土曜の晩、婚活パーティを開催します。年齢は20〜50歳の方。たくさんのご応募、お待ちしています。",
      image: File.open('app/assets/images/celebrate-party.jpeg'),
      user_id:2,
      likes_count: 0
    },
    {
      title: "金曜の晩にパーティしませんか？",
      content: "今週の金曜、スペインバルTRESを貸し切って、パーティします。参加費は3000円です。",
      image: File.open('app/assets/images/chat-party.jpeg'),
      user_id:3,
      likes_count: 0
    },
    {
      title: "自習室提供",
      content: "昨年まで、▲▲塾で使用していた大部屋が、閉校により空いています。テスト勉強をしたい方、静かに作業に集中したい方などなどに、この部屋を使ってもらいたいです。使用料は1人500円で一律です。平日10時〜21時まで開けてます。是非！！！",
      image: File.open('app/assets/images/studying.jpeg'),
      user_id:4,
      likes_count: 0
    },
    {
      title: "プログラミング勉強会",
      content: "木曜日の3時から、曽根図書館の会議室２にて、プログラミング勉強会を開催します。言語は問いません。未経験で、何から始めていいのかわからないという人も大歓迎！！",
      image: File.open('app/assets/images/making-note.jpeg'),
      user_id:1,
      likes_count: 0
    },
    {
      title: "保育士の卵必見！！[大学生ボランティア募集]",
      content: "6月22日から始まる３日間の〇〇保育園のキャンプにボランティアとして、一緒に園児たちと過ごしてくれる方を募集しています。資格などは必要ありません。子供が好きで、無邪気な子供たちと明るく過ごしていただける方ならどなたでも歓迎します！",
      image: File.open('app/assets/images/child-camp.jpeg'),
      user_id:2,
      likes_count: 0
    },
    {
      title: "ただいまセール中！！！",
      content: "スーパー王手では、ただいまセール中です！全商品30%オフの大特価！！ぜひ、足をお運びください。",
      image: File.open('app/assets/images/sale.jpeg'),
      user_id:3,
      likes_count: 0
    },
    {
      title: "大幅値下げ！！！",
      content: "もりもり商店では、4月8日からの一週間、惣菜類を２０%オフで販売致しております。是非ともお立ち寄りくださいませ。",
      image: File.open('app/assets/images/sale-market.jpeg'),
      user_id:4,
      likes_count: 0
    },
    {
      title: "農業体験してみませんか？",
      content: "毎週水曜日、□□あたりの畑で、早朝から畑仕事を手伝ってくれる人募集します。私たちが普段何気なく口にしている野菜たちがどのように収穫され、どのように出荷されているのか、規格外の野菜たちはどのように扱われているのか、全て話します。手伝ってくれたお礼と言ってはなんですが、好きなお野菜をプレゼントします。誰でも歓迎です。",
      image: File.open('app/assets/images/vegetable.jpeg'),
      user_id:1,
      likes_count: 0
    }
  ]
)
# list = %w(ボランティア 教室・勉強会 セール ソーシャル 婚活)

# list.each{ |tag|
#   tag_list = ActsAsTaggableOn::Tag.new
#   tag_list.name = tag
#   tag_list.save
# }



