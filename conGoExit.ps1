# スクリプト実行前に仕様と注意事項を表示して、
# 実行(スクリプト処理の続行)か中断をする

$msg1 = "このスクリプトは（簡単な仕様）を実行します"
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg1,$msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"
