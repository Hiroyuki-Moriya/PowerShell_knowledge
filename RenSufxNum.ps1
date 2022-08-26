# 更新日時の順にソートして、
# その順に番号を振り、ファイル名の後ろにつけてリネームする

# 抽出対象のファイルをワイルドカードで指定
$target_filename = "*.txt"

# 動作環境のルートフォルダ
#$env_root = "D:\Users\hogehoge\PS1_test\"
$env_root = "C:\Users\AVD_moriya\Desktop\PS1_test\"
# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "MST" #★
$path1 = $env_root + $target_folder

# Tips
# [PowerShellでファイルを更新日時の古い順に表示](https://minus9d.hatenablog.com/entry/20130224/1361715645)
# [オブジェクトの並べ替え](https://docs.microsoft.com/ja-jp/powershell/scripting/samples/sorting-objects?view=powershell-7.2)
#    現在のディレクトリ内のサブディレクトリとファイルを一覧表示する問題について考えます。
#    LastWriteTime で並べ替えた後、Name で並べ替えるには、次のように入力します。
#        Get-ChildItem |
#          Sort-Object -Property LastWriteTime, Name |
#          Format-Table -Property LastWriteTime, Name

# [ファイル名をリネーム。ファイル名の先頭に連番を付ける](https://buralog.jp/powershell-file-rename/)
#    [string]$format = “{0:0000}” -f $counter
#       「-f」オプションを使って値のフォーマットをします。
#       「1」なら「0001」、「100」なら「0100」といった感じで値を$format変数に入力します。
#

# [文字列フォーマット演算子](https://yanor.net/wiki/?PowerShell/文法/文字列フォーマット演算子)
#    0プレースホルダー（指定する桁で0パディング）
#        "{0:00}"   -f 1      # 01    足りない桁を0パディング
#

# [数値を文字列に変換する](https://win.just4fun.biz/?PowerShell/数値を文字列に変換する)
#    例  $a=100 , $b=200
#        $a + $b  → 結果 300
#        [string]$a + [string]$b → 結果 100200

$counter = 0
$files = Get-ChildItem -Path $path1 -File -Filter $target_filename
$files | Sort-Object LastWriteTime | forEach-object{
     [string]$format = "{0:0000}" -f $counter
     $newName = $_.Basename + "_"  + $format + $_.Extension
     Rename-Item -LiteralPath $_.FullName -NewName $newName
     $counter = $counter + 10
}
