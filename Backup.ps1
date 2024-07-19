### Original Backup81101.ps1
### Original Creation date 2024/7/19 22:28
### Author Hiroyuki.Moriya

## Step1
## バックアップ対象のファイル(以下、<source>と略記)を、
## バックアップ先のフォルダ(以下、<backup>と略記)へコピーする。
## コピー時にファイル名に"_bkp"の文字列をサフィックスする。

# <source>のパスとファイル名
  $Source_Path = "D:\Users\HIROYUKI\SourceLibrary\"
  $Source_filename = "SourceFile.xlsx"
  $Source = $Source_Path + $Source_filename

# <backup>のパスとファイル名
   $Backup_path = "D:\Users\HIROYUKI\Downloads\WORK\"
   $Backup_filename = "SourceFile_bkp.xlsx"
   $Backup = $Backup_path + $Backup_filename

## Step2
## 実行直前の警告表示

$msg1 = $Source_filename + "を" + $Backup_path + "フォルダーにバックアップします"
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg1,$msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"

## Step3
## コピー実行

Copy-Item -Path $Source -Destination $Backup 

## Step4
## <backup>にコピーしたファイルのファイル名をリネームする。
## リネーム時に、ファイル名の後ろにファイル更新日付をサフィックスしてリネームする。
## ★既にバックアップ済の場合は、エラーメッセージ"Rename-Item : 既に存在するファイルを作成することはできません。"が表示される。

$LWT = Get-ItemPropertyValue -Path $Backup -Name LastWriteTime
$BSN = Get-ItemPropertyValue -Path $Backup -Name Basename
$EXT = Get-ItemPropertyValue -Path $Backup -Name Extension
$NewName =  $BSN + $LWT.ToString("yyyyMMdd-HHmmss") + $EXT

Rename-Item -Path $Backup -NewName $NewName