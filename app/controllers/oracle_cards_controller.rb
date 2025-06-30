class OracleCardsController < ApplicationController
  def index
    # 34枚のカードをランダムに並べる
    @cards = (0..33).to_a.shuffle
  end

  def show
    # 選択されたカードの詳細を表示
    @card_number = params[:id].to_i
    @oracle_card = OracleCard.find_by(number: @card_number)
    
    # カードが存在しない場合は、デフォルトのメッセージを表示
    unless @oracle_card
      @oracle_card = OracleCard.new(
        number: @card_number,
        title: "カード #{@card_number}",
        description: "今日のあなたへのメッセージ",
        message: "あなたの直感を信じてください。今日は素晴らしい日になるでしょう。"
      )
    end
  end

  def select
    # ランダムにカードを選択
    @card_number = rand(34)
    redirect_to oracle_card_path(@card_number)
  end
end
