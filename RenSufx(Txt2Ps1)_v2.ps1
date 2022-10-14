# Powshellのスクリプト(*.ps1)をメールすると拒否されるし、誤って実行されるのは危ないので、
# 拡張子(.ps1)の後ろにさらに接尾文字(.txt)を付加して、無害化した。
# 無害化したスクリプト(*.ps1.txt)を元に戻す(*.ps1)
# 例　test.ps1.txt → test.ps1
# リネーム対象を(*.ps1.txt)に絞り込む

# 動作環境のルートフォルダ
$env_root  = Split-Path $myInvocation.MyCommand.path

# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "\*" #★
$path1 = $env_root + $target_folder

# 処理対象のファイル名
$Target_filename = "*.ps1.txt" #★

# Tips
#  -Include 絞り込み  
#  -Exclude 除外
#  -Recurse Pathで指定したディレクトリとそのサブディレクトリから項目を取得することを意味する。includeとexcludeと一緒に指定する。
#           このパラメーターが指定されているときは、Path パラメーターの末尾のアスタリスク (*) は省略可能。
#  解説
#    Recurseを指定するとサブディレクトリも対象にするので、サブディレクトリを対象にしない場合は、
#    Recurseを指定せず、Pathの最後に "\*" をつける必要がある。  例) "PS1_test\*"

$files = Get-ChildItem -Path $path1 -File -Include $Target_filename
$files | forEach-object{
     $newName = $_.Basename #★ $_.Basenamの中に拡張子(ps1)が入っているので、$_.Extensionの結合をしない
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }

exit 0