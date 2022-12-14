# 動作環境のルートフォルダ
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# copy from to のフォルダ名
$copyFrom = "NAS"
$copyFrom_folder = $env_root + $copyFrom
$copyto = "MST"
$copyTo_folder = $env_root + $copyto

# 対象ファイル一覧を出力する直前の警告表示
$msg1 = $copyFrom + "フォルダから" + $copyto + "へファイルをすべてコピーします"
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg1,$msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"

# MSTフォルダがないことが前提で、フォルダ名をNASからMSTに変えてその配下のファイルをすべてコピーする
# MSTフォルダがあると、MST配下にNASフォルダを作ってしまうが、NAS配下のフォルダ構造やファイルはコピーできる
Remove-item -Path $copyTo_folder -Recurse -Force
Copy-Item -Path $copyFrom_folder -destination $copyTo_folder -Recurse
#
# 初期創成時に一回だけ実行するために作成してある。
# 二回以上使用した場合、新規追加はできるが、人出で削除や更新日時の見極め作業をすることになるので、このPS1スクリプトはそれに向いてない
# いらないフォルダもコピーするので手で消すこと
# 上書きしないように -Force オプションは外した