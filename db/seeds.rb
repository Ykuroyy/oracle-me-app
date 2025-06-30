# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# オラクルカードのサンプルデータを作成
oracle_cards_data = [
  {
    number: 0,
    title: "新しい始まり",
    description: "希望の光",
    message: "今日は新しいスタートを切る絶好の日です。過去の不安を手放し、未来への一歩を踏み出しましょう。あなたの内なる光が道を照らしてくれます。"
  },
  {
    number: 1,
    title: "愛と調和",
    description: "心の平和",
    message: "周りの人々との関係に愛と理解をもたらしましょう。優しさと思いやりがあなたの心を満たし、平和な一日をもたらします。"
  },
  {
    number: 2,
    title: "直感を信じて",
    description: "内なる声",
    message: "今日は直感を大切にしてください。あなたの心の声に耳を傾け、それに従って行動することで、正しい道が見えてきます。"
  },
  {
    number: 3,
    title: "感謝の心",
    description: "豊かさの源",
    message: "今あるものに感謝することで、さらなる豊かさがあなたの人生に流れ込んできます。小さな幸せに目を向けてみましょう。"
  },
  {
    number: 4,
    title: "勇気と行動",
    description: "前進の力",
    message: "恐れを手放し、勇気を持って行動する時です。あなたには必要な力がすべて備わっています。信じて一歩を踏み出しましょう。"
  },
  {
    number: 5,
    title: "癒しの時間",
    description: "心の休息",
    message: "今日は自分自身を大切にし、心と体を癒す時間を作りましょう。優しく自分を労わることで、新たなエネルギーが湧いてきます。"
  },
  {
    number: 6,
    title: "創造性の開花",
    description: "表現の喜び",
    message: "あなたの創造性が今、開花の時を迎えています。自由に表現し、新しいアイデアを形にしてみましょう。"
  },
  {
    number: 7,
    title: "友情の絆",
    description: "つながりの力",
    message: "大切な人との絆を深める日です。心を開いてコミュニケーションを取ることで、より深い理解と愛が生まれます。"
  },
  {
    number: 8,
    title: "変化への準備",
    description: "成長の兆し",
    message: "人生に新しい変化が訪れようとしています。柔軟な心で変化を受け入れ、成長の機会として捉えましょう。"
  },
  {
    number: 9,
    title: "内なる平和",
    description: "静寂の美しさ",
    message: "忙しい日常の中で、静かな時間を見つけてください。内なる平和があなたの心を満たし、明確な視点をもたらします。"
  },
  {
    number: 10,
    title: "豊かな収穫",
    description: "努力の実り",
    message: "これまでの努力が実を結ぶ時が来ています。自分の成長と達成を認め、喜びを感じてください。"
  },
  {
    number: 11,
    title: "優しさの力",
    description: "思いやりの心",
    message: "今日は特に優しさを大切にしてください。あなたの思いやりが周りの人々の心を温め、美しい循環を生み出します。"
  },
  {
    number: 12,
    title: "夢への道筋",
    description: "希望の光",
    message: "あなたの夢に向かう道筋が見えてきています。小さな一歩でも構いません。夢に向かって歩み続けましょう。"
  },
  {
    number: 13,
    title: "自然との調和",
    description: "大地の恵み",
    message: "自然の美しさと力を感じる時間を作ってください。大地のエネルギーがあなたを癒し、新たな活力を与えてくれます。"
  },
  {
    number: 14,
    title: "学びの喜び",
    description: "知識の光",
    message: "新しいことを学ぶ絶好の機会です。好奇心を大切にし、知識を通じて自分自身を豊かにしていきましょう。"
  },
  {
    number: 15,
    title: "家族の愛",
    description: "温かな絆",
    message: "家族との時間を大切にしてください。愛と理解に満ちた関係が、あなたの心に安らぎと力をもたらします。"
  },
  {
    number: 16,
    title: "自信の輝き",
    description: "内なる強さ",
    message: "あなたの内なる強さと美しさを信じてください。自信を持って行動することで、素晴らしい結果を引き寄せます。"
  },
  {
    number: 17,
    title: "許しの力",
    description: "心の解放",
    message: "過去の痛みや怒りを手放し、許しの心を持ちましょう。許すことで、あなたの心は自由になり、新しい可能性が開かれます。"
  },
  {
    number: 18,
    title: "バランスの調和",
    description: "中庸の美",
    message: "仕事とプライベート、与えることと受け取ることのバランスを見直してみましょう。調和のとれた生活が幸福をもたらします。"
  },
  {
    number: 19,
    title: "奇跡の瞬間",
    description: "魔法の時",
    message: "今日は小さな奇跡に注目してください。日常の中に隠れた美しさと驚きを発見することで、人生がより豊かになります。"
  },
  {
    number: 20,
    title: "情熱の炎",
    description: "熱い想い",
    message: "あなたの情熱を燃やす時です。心から愛することや夢中になれることに時間を注ぎ、生命力を高めましょう。"
  },
  {
    number: 21,
    title: "静寂の智慧",
    description: "深い洞察",
    message: "静かな時間の中で、深い洞察が得られます。瞑想や内省を通じて、人生の真の意味を見つけてください。"
  },
  {
    number: 22,
    title: "喜びの分かち合い",
    description: "幸せの循環",
    message: "あなたの喜びを周りの人と分かち合いましょう。幸せは分け合うことで何倍にも大きくなり、美しい循環を生み出します。"
  },
  {
    number: 23,
    title: "新月の願い",
    description: "新たな始まり",
    message: "新しい願いを宇宙に託す時です。心からの願いを明確にし、その実現に向けて行動を起こしましょう。"
  },
  {
    number: 24,
    title: "満月の感謝",
    description: "完成の美",
    message: "これまでの歩みに感謝し、達成したことを祝いましょう。満ち足りた心で次のステージへ進む準備をしてください。"
  },
  {
    number: 25,
    title: "風の導き",
    description: "自由な精神",
    message: "風のように自由な心で、新しい可能性を探求してください。固定観念を手放し、柔軟性を持って人生を楽しみましょう。"
  },
  {
    number: 26,
    title: "水の流れ",
    description: "浄化の力",
    message: "水のように柔軟で清らかな心を保ちましょう。古いエネルギーを洗い流し、新鮮な気持ちで今日を迎えてください。"
  },
  {
    number: 27,
    title: "大地の安定",
    description: "根を張る力",
    message: "しっかりとした基盤を築く時です。地に足をつけて、着実に目標に向かって歩んでいきましょう。"
  },
  {
    number: 28,
    title: "火の情熱",
    description: "変革の力",
    message: "内なる火を燃やし、変革の力を発揮してください。古いものを手放し、新しい自分に生まれ変わる時です。"
  },
  {
    number: 29,
    title: "星の導き",
    description: "運命の道",
    message: "星々があなたの道を照らしています。運命を信じ、宇宙の流れに身を委ねながら、自分らしい道を歩んでください。"
  },
  {
    number: 30,
    title: "虹の約束",
    description: "希望の架け橋",
    message: "困難の後には必ず美しい虹が現れます。今の試練を乗り越えれば、素晴らしい未来があなたを待っています。"
  },
  {
    number: 31,
    title: "蝶の変容",
    description: "美しい変化",
    message: "あなたは美しい変容の時を迎えています。蝶のように、内なる美しさを外に表現し、新しい自分として羽ばたきましょう。"
  },
  {
    number: 32,
    title: "花の開花",
    description: "美の表現",
    message: "あなたの美しさと才能が開花する時です。自分らしさを大切にし、世界にあなたの美しさを表現してください。"
  },
  {
    number: 33,
    title: "無限の可能性",
    description: "限りない未来",
    message: "あなたの前には無限の可能性が広がっています。制限を設けず、大きな夢を抱いて、可能性を信じて進んでください。"
  }
]

# データベースに保存
oracle_cards_data.each do |card_data|
  OracleCard.find_or_create_by(number: card_data[:number]) do |card|
    card.title = card_data[:title]
    card.description = card_data[:description]
    card.message = card_data[:message]
    card.image_url = "card_#{card_data[:number]}.jpg"
  end
end

puts "オラクルカードのサンプルデータを作成しました！"
