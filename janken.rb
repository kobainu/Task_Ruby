puts "じゃんけん..."

loop {
  # ジャンケン-------------------------------------------------------------------------
  options_1 = ["グー", "チョキ", "パー", "戦わない"]
  puts "0(#{options_1[0]}) 1(#{options_1[1]}) 2(#{options_1[2]}) 3(#{options_1[3]})"

    # 「あなた」の選択を取得 => 入力受付
    input = gets.chomp
    # 数値以外の入力を省く(数値以外 =>「0」と認識されるため)
    case input
    when '0', '1', '2', '3'
      my_choice = input.to_i
    else
      puts "0~3を選択してください"
      next
    end

    # 「相手」の選択をランダムに取得
    opponent_choice = rand(0...3)

    # あいこ場合はループの始めに戻る
    if my_choice == opponent_choice
      puts "ホイ！"
      puts "------------------------------------------"
      puts "あなた:#{options_1[my_choice]}を出しました"
      puts "相手:#{options_1[opponent_choice]}を出しました"
      puts "------------------------------------------"
      puts "あいこで..."
      next
    end
    
    # 「あなた」の選択
    case my_choice
    when 0
      # 「相手」の選択
      case opponent_choice
      when 1
        puts "ホイ！"
        puts "------------------------------------------"
        puts "あなた:#{options_1[my_choice]}を出しました"
        puts "相手:#{options_1[opponent_choice]}を出しました"
        puts "------------------------------------------"
        puts "ジャンケンに勝った！！"
        result = "win"

      when 2
        puts "ホイ！"
        puts "------------------------------------------"
        puts "あなた:#{options_1[my_choice]}を出しました"
        puts "相手:#{options_1[opponent_choice]}を出しました"
        puts "------------------------------------------"
        puts "ジャンケンに負けた！"
        result = "lose"
      end
      
    when 1
      case opponent_choice
      when 0
        puts "ホイ！"
        puts "------------------------------------------"
        puts "あなた:#{options_1[my_choice]}を出しました"
        puts "相手:#{options_1[opponent_choice]}を出しました"
        puts "------------------------------------------"
        puts "ジャンケンに負けた！"
        result = "lose"

      when 2
        puts "ホイ！"
        puts "------------------------------------------"
        puts "あなた:#{options_1[my_choice]}を出しました"
        puts "相手:#{options_1[opponent_choice]}を出しました"
        puts "------------------------------------------"
        puts "ジャンケンに勝った！"
        result = "win"
      end
      
    when 2
      case opponent_choice
      when 0
        puts "ホイ！"
        puts "------------------------------------------"
        puts "あなた:#{options_1[my_choice]}を出しました"
        puts "相手:#{options_1[opponent_choice]}を出しました"
        puts "------------------------------------------"
        puts "ジャンケンに勝った！"
        result = "win"

      when 1
        puts "ホイ！"
        puts "------------------------------------------"
        puts "あなた:#{options_1[my_choice]}を出しました"
        puts "相手:#{options_1[opponent_choice]}を出しました"
        puts "------------------------------------------"
        puts "ジャンケンに負けた！"
        result = "lose"
      end
      
    when 3
      puts "逃げた！"
      return
      
    else
      break
    end
  

  # あっち向いてホイ---------------------------------------------------------------------
  options_2 = ["上", "下", "左", "右"]
  puts "あっち向いて〜"
  loop {
    puts "0(#{options_2[0]}) 1(#{options_2[1]}) 2(#{options_2[2]}) 3(#{options_2[3]})"

    # 「あなた」の選択を取得 => 入力受付
    input_2 = gets.chomp
    # 数値以外の入力を省く(数値以外 =>「0」と認識されるため)
    case input_2
    when '0', '1', '2', '3'
      @my_choice_2 = input_2.to_i
      break
    else
      puts "0~3を選択してください"
    end
  }

  # 「相手」の選択をランダムに取得
  opponent_choice_2 = rand(0...3)
  
  puts "ホイ！"
  puts "------------------------------------------"
  puts "あなた:#{options_2[@my_choice_2]}"
  puts "相手:#{options_2[opponent_choice_2]}"
  puts "------------------------------------------"

  # ジャンケンに勝っていた場合
  if result == "win"
    if @my_choice_2 == opponent_choice_2
      puts "あなたの勝ちです！"
      break
    else
      puts "ハズレ！"
    end
  # ジャンケンに負けていた場合
  else
    if @my_choice_2 == opponent_choice_2
      puts "あなたの負けです！"
      break
    else
      puts "セーフ！"
    end
  end

  # 次の周へ
  puts "じゃんけん..."
}