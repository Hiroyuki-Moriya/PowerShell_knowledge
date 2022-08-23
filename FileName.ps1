# 表示対象のファイルをワイルドカードで指定
$target_filename = "*.txt"
# 動作環境のルートフォルダ
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# 表示対象のフォルダ（サブフォルダも表示対象になる） 
$path1 = $env_root + "MST\♪artist\♪album1"

$list = Get-ChildItem $path1 -Filter $target_filename -Recurse
forEach ($item in $list) {
	Write-Output "item=",$item
	Write-Output "item.FullName=",$item.FullName
	Write-Output "item.Name=",$item.Name
	Write-Output "item.BaseName=",$item.BaseName
	Write-Output "item.Extension=",$item.Extension
	
	$CRtime = Get-ItemPropertyValue -Name CreationTime -LiteralPath $item.FullName 
    write-output "CRtime=",$CRtime   # 作成日

	write-output "CreationTime=",$item.CreationTime   # 作成日
	write-output "LastWriteTime=",$item.LastWriteTime # 最終更新日時
	write-output "LastAccessTime=",$item.LastAccessTime # 最終アクセス日時

}
