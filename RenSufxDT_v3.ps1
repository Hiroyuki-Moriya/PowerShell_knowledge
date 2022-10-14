# 特定のフォルダのファイル名の後ろに
# ファイル作成日時をつけてリネームする
# 起動時にコンソールからリネーム対象と対象外のファイル名を指定できる

# 動作環境のルートフォルダ
$env_root  = Split-Path $myInvocation.MyCommand.path

# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "\*" #★
$path1 = $env_root + $target_folder

# 処理対象のファイル名
# $Target_filename = "*.txt" #★
$Target_filename = $args[0]

# 処理対象外のファイル名
# $unTarget_filename = "RenSufxDT_v3.ps1" #★
$unTarget_filename = $args[1]

# Tips
# [ファイル名をリネーム　ファイル作成日に置き換える](https://buralog.jp/powershell-filerename-by-creationtime/)
# [ファイルの作成日時や更新日時を取得する](https://hosopro.blogspot.com/2016/11/powershell-get-itemproperty.html)

#	CreationTime   ファイル作成日時
#	LastWriteTime  最新日時
#	LastAccessTime アクセス日時  

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
     $newName =  $_.Basename + $_.CreationTime.ToString("_yyyyMMdd-HHmmss") + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }