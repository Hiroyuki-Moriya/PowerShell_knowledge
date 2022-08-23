# 改名対象のファイルをワイルドカー$TypeInドで指定
$target_filename = "*.txt"
# 出力するログファイル名
$log_filename = "PS1_test_RenSufx.log"
# 動作環境のルートフォルダ
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# 処理対象のフォルダ（サブフォルダも対象になる） 
$path1 = $env_root + "MST"
# 接尾文字
$suffix = "[Test]"

# Tips
# コンソール文字に色を付ける
# https://tex2e.github.io/blog/powershell/Write-Host-Color

# 対象ファイル一覧を出力する直前の警告表示
$msg0 = "--- step1 ---"
$msg1 = "MSTフォルダ配下の"+$target_filename+"ファイルを"+$log_filename+"に"
Write-Output $msg0,$msg1
Write-Host "出力します" -ForegroundColor red

# ファイル書き込み用のストリームを開く：New-Object System.IO.StreamWriter()
$textfile = $env_root+$log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- 改名対象のファイル一覧 ---")

# サブディレクトリを含むディレクトリの中から(-Recurse)、
# ファイル名のみを取得し(-File)、
# 改名対象を抽出して($target_filename)、
# ファイルに出力する：$file.WriteLine()
# 2度実行すると後ろに追加されるので、注意。
$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# ファイルを閉じる：$file.Close()
$file.Close()

# 対象ファイルを改名する直前の警告表示
$msg0 = "--- step2 ---"
$msg1 = "MSTフォルダ配下の"+$target_filename+"ファイルを"
Write-Output $msg0,$msg1
Write-Host "接尾文字"+$suffix+"をつけて改名します" -BackgroundColor red
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"

#Tips [Rename-Itemで一括リネーム チートシート](https://catovis.com/archives/419)
#    ForEach-Object で処理対象となるオブジェクトは $_ という変数でアクセスすることができます。

#Tips [powershellで角括弧、ブラケットが入った文字を扱う時は注意する](https://arimasou16.com/blog/2014/02/08/00132/)
#    角括弧・ブラケット[]があると、 角括弧はキャストする型を表すので-Pathには使えない。
#    角括弧がそのまま文字列で解釈されるように-LiteralPathを使う。

$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	$newName = $item.Basename + $suffix + $item.Extension
	Rename-Item -LiteralPath $item.FullName -NewName $newName
}

# 対象ファイル一覧を出力する直前の警告表示
$msg0 = "--- step3 ---"
$msg1 = "MSTフォルダ配下の"+$target_filename+"ファイルを"+$log_filename+"に"
Write-Output $msg0,$msg1
Write-Host "出力します" -ForegroundColor red

# ファイル書き込み用のストリームを開く：New-Object System.IO.StreamWriter()
$textfile = $env_root+$log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- 改名後のファイル一覧 ---")

# サブディレクトリを含むディレクトリの中から(-Recurse)、
# ファイル名のみを取得し(-File)、
# 改名対象を抽出して($target_filename)、
# ファイルに出力する：$file.WriteLine()
# 2度実行すると後ろに追加されるので、注意。
$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# ファイルを閉じる：$file.Close()
$file.Close()
