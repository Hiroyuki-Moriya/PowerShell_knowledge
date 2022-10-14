### 処理１のスクリプト（引数の文字列をテキストファイルに書き出す）

# 呼び出し元スクリプトは call_ps1_Parent.ps1

$Current = Split-Path $myInvocation.MyCommand.path
$input   = $args[0]
 
$outFile = "$Current\hoge.txt"
Write-Output "引数に $input が入力されました" | out-file $outFile -encoding default