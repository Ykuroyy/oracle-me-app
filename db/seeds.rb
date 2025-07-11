# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 既存のデータを削除（本番環境でも確実に実行）
puts "🗑️ 既存のオラクルカードデータを削除中..."
OracleCard.delete_all
puts "✅ 既存データの削除完了"

# Oracle Cards データ
oracle_cards_data = [
  { number: 0, title: "愚者", description: "✨ 新しい始まりの光 ✨", message: "今日は新しいことに挑戦するのに最適な日です。恐れずに一歩を踏み出しましょう。" },
  { number: 1, title: "魔術師", description: "🌟 無限の可能性の扉 🌟", message: "あなたには無限の可能性があります。自分の力を信じて、目標に向かって進みましょう。" },
  { number: 2, title: "女教皇", description: "🌙 月の女神の導き 🌙", message: "あなたの直感を信じてください。内なる声が正しい道を示してくれます。" },
  { number: 3, title: "女帝", description: "🌸 母なる大地の恵み 🌸", message: "今日は豊かさと恵みに満ちた日です。周りの人々に優しさを分け与えましょう。" },
  { number: 4, title: "皇帝", description: "👑 内なる女王の力 👑", message: "あなたのリーダーシップが求められています。自信を持って決断を下しましょう。" },
  { number: 5, title: "教皇", description: "🙏 天使からの導き 🙏", message: "伝統的な価値観や精神的な導きに従うことで、正しい道を見つけられます。" },
  { number: 6, title: "恋人", description: "💕 愛の天使の祝福 💕", message: "愛と調和の日です。大切な人との関係を深め、正しい選択をしましょう。" },
  { number: 7, title: "戦車", description: "⚡ 勝利の女神の力 ⚡", message: "困難を乗り越えて勝利を掴む日です。強い意志を持って進みましょう。" },
  { number: 8, title: "力", description: "🦁 内なる女神の勇気 🦁", message: "あなたの内なる強さを信じてください。勇気を持って困難に立ち向かいましょう。" },
  { number: 9, title: "隠者", description: "🔮 内なる知恵の光 🔮", message: "一人の時間を大切にし、自分自身と向き合うことで真の答えを見つけられます。" },
  { number: 10, title: "運命の輪", description: "🎡 運命の女神の導き 🎡", message: "人生は常に変化しています。変化を受け入れ、新しい機会を掴みましょう。" },
  { number: 11, title: "正義", description: "⚖️ 天秤座の女神の裁き ⚖️", message: "公平さと正義を大切にする日です。バランスの取れた判断を心がけましょう。" },
  { number: 12, title: "吊るされた人", description: "🕊️ 新しい視点への目覚め 🕊️", message: "時には立ち止まって、物事を別の角度から見ることで新しい発見があります。" },
  { number: 13, title: "死神", description: "🦋 魂の変容と再生 🦋", message: "古いものを手放し、新しい始まりを受け入れましょう。変化は成長の証です。" },
  { number: 14, title: "節制", description: "🌈 調和の天使の祝福 🌈", message: "バランスの取れた生活を心がけましょう。調和があなたに平安をもたらします。" },
  { number: 15, title: "悪魔", description: "💎 物質の誘惑からの解放 💎", message: "物質的な誘惑に注意しましょう。本当に大切なものを見失わないでください。" },
  { number: 16, title: "塔", description: "⚡ 神の啓示の光 ⚡", message: "突然の変化が訪れるかもしれません。それを受け入れ、新しい視点を得ましょう。" },
  { number: 17, title: "星", description: "⭐ 希望の星の導き ⭐", message: "希望の星があなたを導いています。夢を信じて、癒しの時を過ごしましょう。" },
  { number: 18, title: "月", description: "🌙 月の女神の神秘 🌙", message: "直感を信じてください。月の光が真実を照らしてくれます。" },
  { number: 19, title: "太陽", description: "☀️ 太陽の女神の輝き ☀️", message: "明るく輝く太陽のような日です。成功と喜びに満ちた時間を過ごしましょう。" },
  { number: 20, title: "審判", description: "🕊️ 魂の復活と覚醒 🕊️", message: "新しい人生の章が始まります。過去を清算し、新しい自分に生まれ変わりましょう。" },
  { number: 21, title: "世界", description: "🌍 完全なる調和の完成 🌍", message: "あなたの努力が実を結ぶ日です。目標を達成し、完全な調和を感じられるでしょう。" },
  { number: 22, title: "道化師", description: "🎭 自由な魂の冒険 🎭", message: "自由な心で冒険を楽しみましょう。制約にとらわれず、自分の道を進んでください。" },
  { number: 23, title: "賢者", description: "🧙‍♀️ 古代の知恵の継承者 🧙‍♀️", message: "深い洞察力があなたを導きます。知恵を活かして正しい判断を下しましょう。" },
  { number: 24, title: "癒し手", description: "💖 愛の癒しの天使 💖", message: "あなたの優しさが他の人を癒します。奉仕の心で周りの人を助けましょう。" },
  { number: 25, title: "創造者", description: "🎨 創造の女神の賜物 🎨", message: "あなたの創造性が花開く日です。新しいアイデアを形にしましょう。" },
  { number: 26, title: "調停者", description: "🕊️ 平和の天使の調停 🕊️", message: "対立を調停し、調和をもたらす力があります。平和な解決を目指しましょう。" },
  { number: 27, title: "探求者", description: "🔍 真理を求める魂 🔍", message: "新しい知識や経験を求めて探求する日です。好奇心を大切にしましょう。" },
  { number: 28, title: "守護者", description: "🛡️ 守護天使の愛 🛡️", message: "あなたの守護力が大切なものを守ります。安全と安心を提供しましょう。" },
  { number: 29, title: "変革者", description: "🦋 魂の進化と変容 🦋", message: "大きな変革の時です。古いものを手放し、新しい自分に進化しましょう。" },
  { number: 30, title: "統合者", description: "🕉️ 完全なる調和の統合 🕉️", message: "すべての要素を統合し、完全な調和を実現する日です。" },
  { number: 31, title: "啓示者", description: "👁️ 第三の目の覚醒 👁️", message: "深い啓示を受け取る日です。真実が明らかになり、新しい理解を得られるでしょう。" },
  { number: 32, title: "超越者", description: "🌟 物質を超越した魂 🌟", message: "物質的な制約を超越し、精神的な自由を体験する日です。" },
  { number: 33, title: "完成者", description: "👑 人生の完成と成就 👑", message: "あなたの人生の一つのサイクルが完成します。すべての努力が報われる日です。" }
]

# Oracle Cards データを作成
puts "🔮 新しいオラクルカードデータを作成中..."
created_count = 0
oracle_cards_data.each do |card_data|
  card = OracleCard.create!(card_data)
  created_count += 1
  puts "✅ カード #{card.number}: #{card.title} を作成しました"
end

puts "🔮 #{created_count}枚のオラクルカードの初期データを作成しました！"

# 作成されたカードの確認
total_cards = OracleCard.count
puts "📊 データベース内の総カード数: #{total_cards}枚"

if total_cards != 34
  puts "⚠️ 警告: 期待される34枚と異なる枚数です。データベースを確認してください。"
else
  puts "🎉 すべてのカードが正常に作成されました！"
end
