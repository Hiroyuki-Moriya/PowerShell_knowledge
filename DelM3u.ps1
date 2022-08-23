# �폜�Ώۂ̃t�@�C�������C���h�J�[�h�Ŏw��
$target_filename = "*.m3u"
# �o�͂��郍�O�t�@�C����
$log_filename = "PS1_test_DelM3u.log"
# ������̃��[�g�t�H���_
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# �����Ώۂ̃t�H���_�i�T�u�t�H���_���ΏۂɂȂ�j 
$path1 = $env_root + "MST"

# �Ώۃt�@�C���ꗗ���o�͂��钼�O�̌x���\��
$msg0 = "--- step1 ---"
$msg1 = "MST�t�H���_�z����"+$target_filename+"�t�@�C����"+$log_filename+"��"
Write-Output $msg0,$msg1
Write-Host "�o�͂��܂�" -ForegroundColor red
$msg2 = "�Ԉ���ċN�������Ȃ�Β��f���Ă�������"
Write-Output $msg2

$msg3 = "���s����Ȃ��Y�܂���y���A���f����Ȃ�΂���ȊO�̕��������Ă�������"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "���f���܂�"
	exit
	}
Write-Output "���s���܂�"

# Tips
# �R���\�[�������ɐF��t����
# https://tex2e.github.io/blog/powershell/Write-Host-Color

# �t�@�C���������ݗp�̃X�g���[�����J���FNew-Object System.IO.StreamWriter()
$textfile = $env_root+$log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- �폜�Ώۂ̃t�@�C���ꗗ ---")

# �T�u�f�B���N�g�����܂ރf�B���N�g���̒�����(-Recurse)�A
# �t�@�C�����݂̂��擾��(-File)�A
# �g���q.m3u�𒊏o����(-File)�A
# �t�@�C���ɏo�͂���F$file.WriteLine()
# 2�x���s����ƌ��ɒǉ������̂ŁA���ӁB
$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# �t�@�C�������F$file.Close()
$file.Close()

# �Ώۃt�@�C�����폜���钼�O�̌x���\��
$msg0 = "--- step2 ---"
$msg1 = "MST�t�H���_�z����"+$target_filename+"�t�@�C����"
Write-Output $msg0,$msg1
Write-Host "�폜���܂�" -BackgroundColor red
$msg2 = "�Ԉ���ċN�������Ȃ�Β��f���Ă�������"
Write-Output $msg2

$msg3 = "���s����Ȃ��Y�܂���y���A���f����Ȃ�΂���ȊO�̕��������Ă�������"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "���f���܂�"
	exit
	}
Write-Output "���s���܂�"

$list = Get-ChildItem $path1 -File $target_filename -Recurse ;
foreach ($item in $list) {
	Remove-Item -Path $item.FullName -Recurse
}