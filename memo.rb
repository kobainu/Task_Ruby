require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

# 入力受付(改行なし) => 入力内容を変数memo_typeに代入
memo_type = gets.chomp

# memo_typeに代入されている値を判定
case memo_type
# 1 => 新規メモ作成
when "1"
  puts "拡張子を除いたファイル名を入力してください"
  # ファイル名の入力受付 => 入力内容を変数titleに代入
  title = gets.chomp

  puts "メモしたい内容を記入してください"
  puts "(ctrl + D)で完了"
  # 内容の入力受付 => 入力内容を変数contentに代入
  content = STDIN.readlines

  # csvファイルを新規作成
  CSV.open("#{title}.csv",'w') do |csv|
    csv << content
   end
  puts "新規ファイルが作成されました"

# 2 => 既存のメモを編集
when "2"
  puts "編集(追記)するファイルの拡張子を除いたファイル名を入力してください"
  # 編集対象ファイルのファイル名を入力受付 => 入力内容を変数titleに代入
  title = gets.chomp
  
  # 入力されたファイル名のファイルを読み込み(該当ファイルの確認)
  # 該当ファイルが無い場合は例外処理へ
  begin
    CSV.open("#{title}.csv")
  rescue
    puts "該当するファイルが存在しません"
    puts "初めからやり直してください"
    return
  end

  puts "編集(追記)する内容を記入してください"
  puts "(ctrl + D)で完了"
  # 内容の入力受付 => 入力内容を変数contentに代入
  content = STDIN.readlines

  # 既存csvファイルに追記
  CSV.open("#{title}.csv",'a') do |csv|
    csv << content
   end
  puts "ファイルが編集されました"

# それ以外
else
  puts "'1'か'2'を入力してください"
  puts "初めからやり直してください"
end