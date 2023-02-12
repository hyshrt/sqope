# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

targets = ["財団法人", "一般財団法人", "公益財団法人", "社団法人", "一般社団法人", "公益社団法人", "特定非営利活動法人", "認定特定非営利活動法人",
           "社会福祉法人", "更生保護法人", "医療法人", "医療法人社団", "医療法人財団", "社会医療法人", "株式会社",
           "有限会社", "合名会社", "合資会社", "合同会社"]

targets.each do |target|
  Target.create(
    group_name: target
  )
end

areas = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県",
         "東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県",
         "三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県",
         "山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県",
         "鹿児島県","沖縄県"]

areas.each do |area|
  Area.create(
    area_name: area
  )
end

fields = ["物理化学","地球科学","生命科学","工学","医学","形式科学","科学技術全般","人文科学","社会科学","環境","教育",
          "スポーツ","福祉","保健・医療","文化・芸術","国際","公共","災害・防災","就労支援","地域開発","起業支援","その他"]

fields.each do |field|
  Field.create(
    field_name: field
  )
end