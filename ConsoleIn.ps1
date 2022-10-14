# PowerShellスクリプトに引数を渡す

# 実行Path C:\Users\AVD_moriya\Desktop\PS1_test
# コンソールからの実行コマンド
# > .\ConsoleIn.ps1 a b

Write-Host $args[0]
Write-Host $args[1]
Read-Host #処理が終了後すぐにウィンドウを閉じさせないため、入力待ちにしている