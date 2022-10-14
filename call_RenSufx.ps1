### 呼び出し元スクリプト（処理１スクリプトと外部プログラムを呼び出すスクリプト）

# [参考 別の.ps1スクリプトや外部プログラムを引数付きで呼び出す](https://pig-log.com/powershell-call-program/)

# 動作環境のルートフォルダ
$env_root  = Split-Path $myInvocation.MyCommand.path
 
# 実行プログラムパス
$Powershell = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
 
### Script呼び出し：（RenSufxDT_v3.ps1）
 
# 処理対象のファイル名
$Target_filename = "*.log" #★ logは2ファイルある

# 処理対象外のファイル名
$unTarget_filename = "call_Note_Parent.log" #★ logの片方を対象外にする
 
# 呼び出すスクリプトを指定
$ScriptFile = "$Current\RenSufxDT_v3.ps1 $Target_filename $unTarget_filename"
$Argument   = "-Command $ScriptFile"

# スクリプトを呼び出す
Start-Process -FilePath $Powershell -ArgumentList $Argument -NoNewWindow -Wait

exit 0