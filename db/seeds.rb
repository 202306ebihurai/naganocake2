# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!([
  { name: "ケーキ" },
  { name: "焼き菓子" },
  { name: "プリン" },
  { name: "キャンディ" }
])

item1 = Item.new(
  name: "いちごのショートケーキ（ホール）",
  introduction: "栃木県産のとちおとめを贅沢に使用しています。",
  price: "2500",
  is_active: true,
  genre_id: 1,
)
item1.image.attach(io: File.open(Rails.root.join("app/assets/images/cake_sample.png")), filename: "cake_sample.png")
item1.save!

Item.create!(
  name: "ストロベリーショートケーキ",
  introduction: "甘酸っぱいストロベリーがたっぷりのせられた、ふんわりとしたショートケーキです。",
  price: 1800,
  is_active: true,
  genre_id: 1,
)
Item.create!(
  name: "チョコマーブルパウンドケーキ",
  introduction: "リッチなチョコレートとバニラの風味が絶妙に絡み合った、しっとりとしたパウンドケーキです。",
  price: 1500,
  is_active: true,
  genre_id: 1,
)
Item.create!(
  name: "シナモンロール",
  introduction: "香り高いシナモンがふんだんに使われた、ほんのり甘くてもっちりとしたロールケーキです。",
  price: 300,
  is_active: true,
  genre_id: 2,
)
Item.create!(
  name: "カラメルプリン",
  introduction: "なめらかなカラメルソースが広がる、濃厚でまろやかなプリンです。",
  price: 400,
  is_active: true,
  genre_id: 3,
)
Item.create!(
  name: "ブルーベリーハードキャンディ",
  introduction: "爽やかなブルーベリーの風味が詰まった、キャンディのクラシックなお楽しみです。",
  price: 100,
  is_active: true,
  genre_id: 4,
)
Item.create!(
  name: "クランチィチョコチップクッキー",
  introduction: "サクサクとした食感の中に、たっぷりのチョコチップが入った、香ばしいクッキーです。",
  price: 200,
  is_active: true,
  genre_id: 2,
)
Item.create!(
  name: "マンゴープリン",
  introduction: "豊かなマンゴーの風味が広がる、滑らかでフルーティーなプリンです。",
  price: 500,
  is_active: true,
  genre_id: 3,
)
Item.create!(
  name: "ベリーパーティーケーキ",
  introduction: "様々なベリーが彩りを添えた、楽しいパーティーにぴったりのケーキです。",
  price: 2000,
  is_active: true,
  genre_id: 1,
)
Item.create!(
  name: "ヘーゼルナッツプリン",
  introduction: "ほろ苦いチョコレートと香ばしいヘーゼルナッツが絶妙なバランスのプリンです。",
  price: 450,
  is_active: true,
  genre_id: 3,
)
Item.create!(
  name: "レモンサワーキャンディ",
  introduction: "さわやかなレモンの酸味と甘さが楽しめる、爽快なサワーキャンディです。",
  price: 80,
  is_active: true,
  genre_id: 4,
)

Customer.create!(
  last_name: "山田",
  first_name: "太郎",
  last_name_kana: "ヤマダ",
  first_name_kana: "タロウ",
  postcode: "123-4567",
  address: "東京都渋谷区1-2-3",
  phone_number: "090-1234-5678",
  email: "test@example.com",
  password: "password",
  is_deleted: false
)

Admin.create!(
  email: "testadmin@example.com",
  password: "aaaaaa",
  )