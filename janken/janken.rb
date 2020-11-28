# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    while true
    # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    # 変数「player_hand」にプレイヤーが入力したものを取得して代入します。
    #[chompメゾット]を使うことでまず文字列で返します。
    player_hand = gets.chomp
      #文字列の0,1,2以外はもう一度入力させる
      unless player_hand == "0" || player_hand == "1" || player_hand == "2"
        puts "0~2の数字を入力してください"
      else
        #chompメゾットで受け取った文字列を数字として返すto_iメゾット
        return player_hand.to_i
      #unless文のend
      end
    #while文のend
    end
  #handメゾットのend
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力させます。randメゾットを使用
    enemy_hand = rand(0..2)
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、
#その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{敵の生成した値}です。」と出力させます。
     puts "相手の手は#{janken[enemy_hand]}です。"
    # Playerクラスの戻り値とEnemyクラスの戻り値からじゃんけんするロジックを作成します。
      while Janken
            # if 条件を書く Playerクラスの戻り値(player_hand)と
            #Enemyクラスの戻り値(enemy_hand)の値が同じだった場合
        if player_hand == enemy_hand
           # 「あいこ」を出力します。
           puts "あいこ"
           #「true」を返してじゃんけんを繰り返し実行させます。
           return true
         elsif #もしも下記の組み合わせだった場合
           (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
           # 「あなたの勝ちです」を出力します。
           puts "あなたの勝ちです"
           # whileを終了させる「false」を返してじゃんけんを終了させます。
           return false
         else #条件以外の場合
           # 「あなたの負けです」を出力します。
           puts "あなたの負けです"
           # whileを終了させる「false」を返してじゃんけんを終了させます。
           return false
         #if文のend
         end
      #while文のend
      end
   #ponメゾットのend
   end
 end
# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new
#next_gameにtrueを代入します
next_game = true
#next_gameがtrueの間はjanken.ponの処理を繰り返すロジックを作ります。
while next_game
  next_game = janken.pon(player.hand, enemy.hand)
#while文のend
end
