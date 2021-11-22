# frozen_string_literal: true

# プレイヤー(自分)に「0~2」を入力させるロジックを書きます。
class Player
  def hand
    puts '数字を入力してください。'
    puts '0:グー, 1:チョキ, 2:パー'
    input_hand = gets.chomp.to_i
    loop do
      if [0, 1, 2].include?(input_hand)
        return input_hand
      else
        puts '0〜2の数字を入力してください。'
        puts '0:グー, 1:チョキ, 2:パー'
        input_hand = gets.chomp.to_i
      end
    end
  end
end

# 相手が「0~2」の値をランダムに生成するロジックを書きます。
class Enemy
  def hand
    # get 0 - 2 randomly
    [0, 1, 2].sample
  end
end

# プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    janken = %W[\u30B0\u30FC \u30C1\u30E7\u30AD \u30D1\u30FC]
    puts "相手の手は#{janken[enemy_hand]}です。"
    if (player_hand - enemy_hand + 3) % 3.zero?
      puts 'あいこ'
      true
    elsif (player_hand - enemy_hand + 3) % 3 == 2
      puts 'あなたの勝ちです'
      false
    else
      puts 'あなたの負けです'
      false
    end
  end
end

# じゃんけんゲームを実行するロジックを書きます。
class GameStart
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    next_game = janken.pon(player.hand, enemy.hand) while next_game
  end
end
# クラス名を使ってjankenponメソッドを呼び出します。
GameStart.jankenpon
