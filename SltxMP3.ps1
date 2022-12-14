# 抽出『対象外』のファイルをワイルドカードで指定
$unTarget_filename = "*.mp3"
# 出力するログファイル名
$log_filename = "PS1_test_SLTX.log"
# 動作環境のルートフォルダ
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# 処理対象のフォルダ（サブフォルダも対象になる） 
$path1 = $env_root + "MST"

# 対象ファイル一覧を出力する直前の警告表示
$msg1 = $unTarget_filename + "以外のファイル名を" + $log_filename + "に出力します"
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg1,$msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"

# 現在のディレクトリにあるファイル名のうち、
# 拡張子.mp3がついていないファイルのみ抽出取得して
# フルパス付ファイル名をPS1_test_SLTX.logファイルの中に出力したい
# 2度実行すると後ろに追加されるので、注意。

# Tips
# ※-Fileオプションを付けて実行すると、結果からフォルダが除外され、ファイルのみ表示される。
# ※-Filterオプションを付けて実行すると、フォルダ名・ファイル名を絞り込んだ結果が表示され、 <=フォルダ名取得可能
#   -Filterの後に文字列を追加すると、その文字列に一致したファイル名のみ表示される。

# ファイル書き込み用のストリームを開く：New-Object System.IO.StreamWriter()
$textfile = $env_root + $log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- 抽出対象のファイル一覧 ---")

# サブディレクトリを含むディレクトリの中から(-Recurse)、
# ファイル名のみを取得し(-File)、
# 拡張子.mp3以外を抽出して(-Exclude)、
# ファイルに出力する：$file.WriteLine()
$list = Get-ChildItem $path1 -File -Exclude $unTarget_filename -Recurse ;
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# ファイルを閉じる：$file.Close()
$file.Close()