# Powshell�̃X�N���v�g(*.ps1)�����[������Ƌ��ۂ���邵�A����Ď��s�����̂͊�Ȃ��̂ŁA
# �g���q(.ps1)�̌��ɂ���ɐڔ�����(.txt)��t�����āA���Q������B
# ��@test.ps1 �� test.ps1.txt


# �����Ώۂ̃t�@�C�������C���h�J�[�h�Ŏw��
$target_filename = ".ps1" #��
$aster_target_filename = "*" + $target_filename
# �o�͂��郍�O�t�@�C����
$log_filename = "PS1_test_RenSufx(ps1toTxt).log"
# ������̃��[�g�t�H���_
$env_root = "D:\Users\hogehoge\PS1_test\" #��
# �����Ώۂ̃t�H���_�i�T�u�t�H���_�͑ΏۊO�B�Ώۂɂ���Ȃ��-Recurse�I�v�V���������邱�Ɓj 
$target_folder = "ENV" #��
$path1 = $env_root + $target_folder
# �ڔ�����
$suffix = ".txt" #��
$aster_suffix = "*" + $suffix #��

# �Ώۃt�@�C���ꗗ���o�͂��钼�O�̌x���\��
$msg0 = "--- step1 ---"
$msg1 = $target_folder + "�t�H���_�z����"+$target_filename+"�t�@�C����"+$log_filename+"��"
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
$list = Get-ChildItem $path1 -File $aster_target_filename #�� -Recurse
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# �t�@�C�������F$file.Close()
$file.Close()

# �Ώۃt�@�C�����������钼�O�̌x���\��
$msg0 = "--- step2 ---"
$msg1 = $target_folder + "�t�H���_�z����"+$target_filename+"�t�@�C����"
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

$list = Get-ChildItem $path1 -File $aster_target_filename #�� -Recurse ;
foreach ($item in $list) {
	$newName = $item.Basename + $item.Extension + $suffix #�� 
	Rename-Item -LiteralPath $item.FullName -NewName $newName
}

# �Ώۃt�@�C���ꗗ���o�͂��钼�O�̌x���\��
$msg0 = "--- step3 ---"
$msg1 = $target_folder + "�t�H���_�z����"+$suffix+"�t�@�C����"+$log_filename+"��"
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
$list = Get-ChildItem $path1 -File $aster_suffix #�� -Recurse
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# �t�@�C�������F$file.Close()
$file.Close()
