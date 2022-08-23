# �����Ώۂ̃t�@�C�������C���h�J�[$TypeIn�h�Ŏw��
$target_filename = "*.txt"
# �o�͂��郍�O�t�@�C����
$log_filename = "PS1_test_RenSufx.log"
# ������̃��[�g�t�H���_
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# �����Ώۂ̃t�H���_�i�T�u�t�H���_���ΏۂɂȂ�j 
$path1 = $env_root + "MST"
# �ڔ�����
$suffix = "[Test]"

# Tips
# �R���\�[�������ɐF��t����
# https://tex2e.github.io/blog/powershell/Write-Host-Color

# �Ώۃt�@�C���ꗗ���o�͂��钼�O�̌x���\��
$msg0 = "--- step1 ---"
$msg1 = "MST�t�H���_�z����"+$target_filename+"�t�@�C����"+$log_filename+"��"
Write-Output $msg0,$msg1
Write-Host "�o�͂��܂�" -ForegroundColor red

# �t�@�C���������ݗp�̃X�g���[�����J���FNew-Object System.IO.StreamWriter()
$textfile = $env_root+$log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- �����Ώۂ̃t�@�C���ꗗ ---")

# �T�u�f�B���N�g�����܂ރf�B���N�g���̒�����(-Recurse)�A
# �t�@�C�����݂̂��擾��(-File)�A
# �����Ώۂ𒊏o����($target_filename)�A
# �t�@�C���ɏo�͂���F$file.WriteLine()
# 2�x���s����ƌ��ɒǉ������̂ŁA���ӁB
$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# �t�@�C�������F$file.Close()
$file.Close()

# �Ώۃt�@�C�����������钼�O�̌x���\��
$msg0 = "--- step2 ---"
$msg1 = "MST�t�H���_�z����"+$target_filename+"�t�@�C����"
Write-Output $msg0,$msg1
Write-Host "�ڔ�����"+$suffix+"�����ĉ������܂�" -BackgroundColor red
$msg2 = "�Ԉ���ċN�������Ȃ�Β��f���Ă�������"
Write-Output $msg2

$msg3 = "���s����Ȃ��Y�܂���y���A���f����Ȃ�΂���ȊO�̕��������Ă�������"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "���f���܂�"
	exit
	}
Write-Output "���s���܂�"

#Tips [Rename-Item�ňꊇ���l�[�� �`�[�g�V�[�g](https://catovis.com/archives/419)
#    ForEach-Object �ŏ����ΏۂƂȂ�I�u�W�F�N�g�� $_ �Ƃ����ϐ��ŃA�N�Z�X���邱�Ƃ��ł��܂��B

#Tips [powershell�Ŋp���ʁA�u���P�b�g���������������������͒��ӂ���](https://arimasou16.com/blog/2014/02/08/00132/)
#    �p���ʁE�u���P�b�g[]������ƁA �p���ʂ̓L���X�g����^��\���̂�-Path�ɂ͎g���Ȃ��B
#    �p���ʂ����̂܂ܕ�����ŉ��߂����悤��-LiteralPath���g���B

$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	$newName = $item.Basename + $suffix + $item.Extension
	Rename-Item -LiteralPath $item.FullName -NewName $newName
}

# �Ώۃt�@�C���ꗗ���o�͂��钼�O�̌x���\��
$msg0 = "--- step3 ---"
$msg1 = "MST�t�H���_�z����"+$target_filename+"�t�@�C����"+$log_filename+"��"
Write-Output $msg0,$msg1
Write-Host "�o�͂��܂�" -ForegroundColor red

# �t�@�C���������ݗp�̃X�g���[�����J���FNew-Object System.IO.StreamWriter()
$textfile = $env_root+$log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- ������̃t�@�C���ꗗ ---")

# �T�u�f�B���N�g�����܂ރf�B���N�g���̒�����(-Recurse)�A
# �t�@�C�����݂̂��擾��(-File)�A
# �����Ώۂ𒊏o����($target_filename)�A
# �t�@�C���ɏo�͂���F$file.WriteLine()
# 2�x���s����ƌ��ɒǉ������̂ŁA���ӁB
$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# �t�@�C�������F$file.Close()
$file.Close()
