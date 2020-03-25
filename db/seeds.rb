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
      title: "溶接工場で働いて見たい人？（ご飯御馳走します。）",
      content: "溶接工場で、溶接体験してみたい人を探しております。",
      image: File.open('app/assets/images/factory-work.jpeg'),
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
      title: "漁師体験",
      content: "漁師体験してみたい人を募集しています。魚の種類、捌き方、",
      image: File.open('app/assets/images/red-fish.jpeg'),
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
      title: "作業員の話し相手募集",
      content: "深夜の工事現場の作業員の話し相手してくれる人を探しています。時給は2000円で、22時〜翌朝6時まで。",
      image: File.open('app/assets/images/road-worker.jpeg'),
      user_id:4,
      likes_count: 0
    },
    {
      title: "八百屋で職業体験してみませんか？",
      content: "毎週水曜日、小林八百屋店のお手伝いしてくれる人を募集してます。",
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



