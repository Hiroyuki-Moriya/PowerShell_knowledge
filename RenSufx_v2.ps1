# 処理対象のフォルダ中にあるPowshellのスクリプト(*.ps1)を処理対象にして
# ファイル名に接尾文字を付加する。

# 動作環境のルートフォルダ
$env_root  = Split-Path $myInvocation.MyCommand.path

# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "\*" #★
$path1 = $env_root + $target_folder

# 処理対象のファイル名
$Target_filename = "*.ps1" #★

# 処理対象外のファイル名
$unTarget_filename = "RenSufx_v2.ps1" #★

# 引数を接尾文字にする
# 引数$args[0]が指定されていなければ省略値[Test]を接尾文字にする
$suffix = $args[0]
If( $suffix.Length -eq 0 ){
	$suffix = "[Test]"
	}

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
	 $newName = $_.Basename + $suffix + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }

exit 0