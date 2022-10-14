# Powshellのスクリプト(*.ps1)をメールすると拒否されるし、誤って実行されるのは危ないので、
# 拡張子(.ps1)の後ろにさらに接尾文字(.txt)を付加して、無害化する。
# 例　test.ps1 → test.ps1.txt
# リネーム対象と対象外のファイル名を指定できる

# 動作環境のルートフォルダ
$env_root  = Split-Path $myInvocation.MyCommand.path

# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "\*" #★
$path1 = $env_root + $target_folder

# 処理対象のファイル名
$Target_filename = "*.ps1" #★

# 処理対象外のファイル名
$unTarget_filename = "RenSufx(ps1toTxt)_v2.ps1" #★

# 接尾文字
$suffix = ".txt" #★

# Tips
#  -Include 絞り込み  
#  -Exclude 除外
#  -Recurse Pathで指定したディレクトリとそのサブディレクトリから項目を取得することを意味する。includeとexcludeと一緒に指定する。
#           このパラメーターが指定されているときは、Path パラメーターの末尾のアスタリスク (*) は省略可能。
#  解説
#    Recurseを指定するとサブディレクトリも対象にするので、サブディレクトリを対象にしない場合は、
#    Recurseを指定せず、Pathの最後に "\*" をつける必要がある。  例) "PS1_test\*"

$files = Get-ChildItem -Path $path1 -File -Include $Target_filename -Exclude $unTarget_filename
$files | forEach-object{
     $newName = $_.Basename + $_.Extension + $suffix #★
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }

exit 0