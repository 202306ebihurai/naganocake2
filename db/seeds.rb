# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
  name: "ケーキ"
)
Genre.create!(
  name: "焼き菓子"
)
Genre.create!(
  name: "プリン"
)
Genre.create!(
  name: "キャンディ"
)

Item.create!(
  name: "いちごのショートケーキ（ホール）",
  introduction: "栃木県産のとちおとめを贅沢に使用しています。",
  price: "2500",
  is_active: true,
  genre_id: 1,
)
10.times do |n|
  Item.create!(
  name: "Test#{n + 1}",
  introduction: "Test#{n + 1}を贅沢に使用しています。",
  price: "1000",
  is_active: true,
  genre_id: 2,
  )
end

# Customer.create!(
#   last_name: "姓",
#   first_name: "名",
#   last_name_kana: "セイ",
#   first_name_kana: "メイ",
#   postcode: "1234567",
#   address: "123456",
#   phone_number: "123456",
#   email: "aaa@aaa",
#   encrypted_password: "aaaaaa",
#   is_deleted: false
# )