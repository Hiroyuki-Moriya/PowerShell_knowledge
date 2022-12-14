# 削除対象のファイルをワイルドカードで指定
$target_filename = "*.m3u"
# 出力するログファイル名
$log_filename = "PS1_test_DelM3u.log"
# 動作環境のルートフォルダ
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# 処理対象のフォルダ（サブフォルダも対象になる） 
$path1 = $env_root + "MST"

# 対象ファイル一覧を出力する直前の警告表示
$msg0 = "--- step1 ---"
$msg1 = "MSTフォルダ配下の"+$target_filename+"ファイルを"+$log_filename+"に"
Write-Output $msg0,$msg1
Write-Host "出力します" -ForegroundColor red
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"

# Tips
# コンソール文字に色を付ける
# https://tex2e.github.io/blog/powershell/Write-Host-Color

# ファイル書き込み用のストリームを開く：New-Object System.IO.StreamWriter()
$textfile = $env_root+$log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- 削除対象のファイル一覧 ---")

# サブディレクトリを含むディレクトリの中から(-Recurse)、
# ファイル名のみを取得し(-File)、
# 拡張子.m3uを抽出して(-File)、
# ファイルに出力する：$file.WriteLine()
# 2度実行すると後ろに追加されるので、注意。
$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# ファイルを閉じる：$file.Close()
$file.Close()

# 対象ファイルを削除する直前の警告表示
$msg0 = "--- step2 ---"
$msg1 = "MSTフォルダ配下の"+$target_filename+"ファイルを"
Write-Output $msg0,$msg1
Write-Host "削除します" -BackgroundColor red
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"

$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	Remove-Item -Path $item.FullName -Recurse
}