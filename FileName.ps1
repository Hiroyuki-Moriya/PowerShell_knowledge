# �\���Ώۂ̃t�@�C�������C���h�J�[�h�Ŏw��
$target_filename = "*.txt"
# ������̃��[�g�t�H���_
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# �\���Ώۂ̃t�H���_�i�T�u�t�H���_���\���ΏۂɂȂ�j 
$path1 = $env_root + "MST\��artist\��album1"

$list = Get-ChildItem $path1 -Filter $target_filename -Recurse
forEach ($item in $list) {
	Write-Output "item=",$item
	Write-Output "item.FullName=",$item.FullName
	Write-Output "item.Name=",$item.Name
	Write-Output "item.BaseName=",$item.BaseName
	Write-Output "item.Extension=",$item.Extension
	
	$CRtime = Get-ItemPropertyValue -Name CreationTime -LiteralPath $item.FullName 
    write-output "CRtime=",$CRtime   # �쐬��

	write-output "CreationTime=",$item.CreationTime   # �쐬��
	write-output "LastWriteTime=",$item.LastWriteTime # �ŏI�X�V����
	write-output "LastAccessTime=",$item.LastAccessTime # �ŏI�A�N�Z�X����

}
