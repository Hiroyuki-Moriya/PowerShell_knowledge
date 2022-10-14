### 処理２のスクリプト（書き出したファイル内容を読み出す）

# 呼び出し元スクリプトは call_ps1_Parent.ps1

$Current = Split-Path $myInvocation.MyCommand.path
 
$outFile = "$Current\hoge.txt"
Get-Content $outFile