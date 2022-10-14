### 呼び出し元スクリプト（処理１スクリプトと処理２スクリプトを呼び出すスクリプト）

# [参考 別の.ps1スクリプトや外部プログラムを引数付きで呼び出す](https://pig-log.com/powershell-call-program/)

# Script設置フォルダパス
$Current  = Split-Path $myInvocation.MyCommand.path
 
# 実行プログラムパス
$Powershell = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
 
### Script呼び出し：テキストファイル書き出し（call_ps1_Child_1.ps1）
 
# 引数指定
$input=$args[0]
 
# 呼び出すスクリプトを指定
$ScriptFile = "$Current\call_ps1_Child_1.ps1 $input"
$Argument   = "-Command $ScriptFile"
 
# スクリプトを呼び出す
Start-Process -FilePath $Powershell -ArgumentList $Argument -NoNewWindow -Wait
 
### Script呼び出し：テキストファイル読み出し（call_ps1_Child_2.ps1）
 
# 呼び出すスクリプトを指定
$ScriptFile = "$Current\call_ps1_Child_2.ps1"
$Argument   = "-Command $ScriptFile"
 
# スクリプトを呼び出す
Start-Process -FilePath $Powershell -ArgumentList $Argument -NoNewWindow -Wait
 
exit 0