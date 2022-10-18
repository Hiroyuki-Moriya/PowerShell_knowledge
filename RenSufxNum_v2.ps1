# フォルダ中にある処理対象ファイルを
# 更新日時の順に番号を振り、それを接尾文字にしてリネームする
# 処理対象ファイルは起動時に指定できる

# 動作環境のルートフォルダ
$env_root  = Split-Path $myInvocation.MyCommand.path

# 処理対象のフォルダ（サブフォルダは対象外。対象にするならば-Recurseオプションをつけること） 
$target_folder = "\*" #★
$path1 = $env_root + $target_folder

# 処理対象外のファイル名
$unTarget_filename = "RenSufxNum_v2.ps1" #★

# 引数を処理対象のファイル名にする
# 引数$args[0]が指定されていなければ省略値"*.txt"を処理対象のファイル名する
$target_filename = $args[0]
If( $target_filename.Length -eq 0 ){
	$target_filename = "*.txt"
	}

$counter = 0
$files = Get-ChildItem -Path $path1 -File -Filter $target_filename -Exclude $unTarget_filename
$files | Sort-Object LastWriteTime | forEach-object{
     [string]$format = "{0:0000}" -f $counter
     $newName = $_.Basename + "_"  + $format + $_.Extension
     Rename-Item -LiteralPath $_.FullName -NewName $newName
     $counter = $counter + 10
}

exit 0