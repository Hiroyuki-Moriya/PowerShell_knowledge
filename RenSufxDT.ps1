# 特定のフォルダのファイル名の後ろに
# ファイル作成日時をつけてリネームする


# 動作環境のルートフォルダ
$env_root = "D:\Users\hogehoge\PS1_test\" #★
# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "ENV" #★
$path1 = $env_root + $target_folder

# Tips
# [ファイル名をリネーム　ファイル作成日に置き換える](https://buralog.jp/powershell-filerename-by-creationtime/)
# [ファイルの作成日時や更新日時を取得する](https://hosopro.blogspot.com/2016/11/powershell-get-itemproperty.html)

#	CreationTime   ファイル作成日時
#	LastWriteTime  最新日時
#	LastAccessTime アクセス日時

$files = Get-ChildItem -Path $path1 -File
$files | forEach-object{
     $newName =  $_.Basename + $_.CreationTime.ToString("_yyyyMMdd-HHmmss") + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }