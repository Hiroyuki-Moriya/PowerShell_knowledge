# Source name RenSufxDT_v4.ps1

# 転用元はほぼ RenSufxDT_v2.ps1 、カスタマイズ部分は "※"の表記あり
# サフィックス部分のみRenSufx_v2.ps1 から転用

# 特定のフォルダのファイル名の後ろに
# 接尾文字(※)とファイル更新日時(※)をつけてリネームする（ファイルコピーすると作成日時がコピー時刻に代わってしまうから）
# リネーム対象と対象外のファイル名を指定できる

# Process(0)
#  Process(1)と(2)の共通のセッティング
#

# 動作環境のルートフォルダ
$env_root = "F:\NAS\デジカメ＆ビデオ\アルバム2024年\" # ※カスタマイズ部分

# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "EOS7DMk2\*" #★ 
$path1 = $env_root + $target_folder

# 処理対象外のファイル名 (下記２行が※)
#   後で定義する「処理対象のファイル名」に含まれるファイル名でありながら処理対象外にするファイル名を記述する。
#   大抵は"null"、でいいがとりあえず PowerShellのファイル名"RenSufxDT_v*.ps1"の記載にしておく
$unTarget_filename = "RenSufxDT_v*.ps1" #★ ※

# サフィックスに使用する接尾文字
$suffix = "_EOS7DMk2" #★ ※カスタマイズ部分かつRenSufx_v2.ps1 から転用部分


# Process(1)
#  JPGを処理対象にする
#

# 処理対象のファイル名
$Target_filename = "*.JPG" #★ <==　処理対象拡張子が２個あるので、*.JPGと*.CR2に書き換えてそれぞれ実行すること　※カスタマイズ部分

$files = Get-ChildItem -Path $path1 -File -Include $Target_filename -Exclude $unTarget_filename
$files | forEach-object{
     $newName =  $_.Basename + $suffix + $_.LastWriteTime.ToString("_yyyyMMdd-HHmmss") + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }

# Process(2)
#  CR2を処理対象にする
#

# 処理対象のファイル名
$Target_filename = "*.CR2" #★ <==　処理対象拡張子が２個あるので、*.JPGと*.CR2に書き換えてそれぞれ実行する　※カスタマイズ部分

$files = Get-ChildItem -Path $path1 -File -Include $Target_filename -Exclude $unTarget_filename
$files | forEach-object{
     $newName =  $_.Basename + $suffix + $_.LastWriteTime.ToString("_yyyyMMdd-HHmmss") + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }


# Tips
# [ファイル名をリネーム　ファイル更新日時に置き換える](https://buralog.jp/powershell-filerename-by-creationtime/)
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

# Tips
#  写真を加工してもファイル名の昇順で並ばせるため、本当は更新日時ではなく、撮影日時を使いたかった。
#  探すとそれを実現した方がいたので、それを手本に後日挑戦しようと思う。
#    メタデータ内の撮影日時情報をもとにファイルの名前/作成日時/更新日時を変更するPowerShellスクリプト
#    https://github.com/t-asano/media-dater
