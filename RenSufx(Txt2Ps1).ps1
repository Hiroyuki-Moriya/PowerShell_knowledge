# Powshellのスクリプト(*.ps1)をメールすると拒否されるし、誤って実行されるのは危ないので、
# 拡張子(.ps1)の後ろにさらに接尾文字(.txt)を付加して、無害化した。
# 無害化したスクリプト(*.ps1.txt)を元に戻す(*.ps1)
# 例　test.ps1.txt → test.ps1

# 改名対象のファイルをワイルドカード抜きで指定
$target_filename = ".ps1.txt" #★
$aster_target_filename = "*" + $target_filename
# 出力するログファイル名
$log_filename = "PS1_test_RenSufx(Txt2Ps1).log"
# 動作環境のルートフォルダ
$env_root = "D:\Users\hogehoge\PS1_test\" #★
# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "ENV" #★
$path1 = $env_root + $target_folder
# 接尾文字
$suffix = ".ps1" #★
$aster_suffix = "*" + $suffix #★

# 対象ファイル一覧を出力する直前の警告表示
$msg0 = "--- step1 ---"
$msg1 = $target_folder + "フォルダ配下の" + $target_filename + "ファイルを" + $log_filename + "に"
Write-Output $msg0,$msg1
Write-Host "出力します" -ForegroundColor red

# ファイル書き込み用のストリームを開く：New-Object System.IO.StreamWriter()
$textfile = $env_root+$log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- 改名対象のファイル一覧 ---")

# サブディレクトリを含むディレクトリの中から(-Recurse)、
# ファイル名のみを取得し(-File)、
# 改名対象を抽出して($target_filename)、
# ファイルに出力する：$file.WriteLine()
# 2度実行すると後ろに追加されるので、注意。
$list = Get-ChildItem $path1 -File $aster_target_filename #★ -Recurse
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# ファイルを閉じる：$file.Close()
$file.Close()

# 対象ファイルを改名する直前の警告表示
$msg0 = "--- step2 ---"
$msg1 = $target_filename+"ファイルを"
Write-Output $msg0,$msg1
Write-Host "接尾文字"+$suffix+"をつけて改名します" -BackgroundColor red
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"

#Tips [文字列を置換する方法](https://bayashita.com/p/entry/show/158)
#    PowerShell で文字列を置換するには Replace メソッドを使用します。
#    Replace メソッドでは、条件に一致した文字列をすべて置換します。
#    例 文字列オブジェクト.Replace(置換前の文字列, 置換後の文字列) 

$list = Get-ChildItem $path1 -File $aster_target_filename #★ -Recurse ;
foreach ($item in $list) {
    $newName = $item.FullName.Replace($target_filename, $suffix) #★
	Rename-Item -LiteralPath $item.FullName -NewName $newName
}

# 対象ファイル一覧を出力する直前の警告表示
$msg0 = "--- step3 ---"
$msg1 = $target_folder + "フォルダ配下の"+$target_filename+"ファイルを"+$log_filename+"に"
Write-Output $msg0,$msg1
Write-Host "出力します" -ForegroundColor red

# ファイル書き込み用のストリームを開く：New-Object System.IO.StreamWriter()
$textfile = $env_root + $log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- 改名後のファイル一覧 ---")

# サブディレクトリを含むディレクトリの中から(-Recurse)、
# ファイル名のみを取得し(-File)、
# 改名対象を抽出して($target_filename)、
# ファイルに出力する：$file.WriteLine()
# 2度実行すると後ろに追加されるので、注意。
$list = Get-ChildItem $path1 -File $aster_suffix #★ -Recurse
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# ファイルを閉じる：$file.Close()
$file.Close()
