# ���o�w�ΏۊO�x�̃t�@�C�������C���h�J�[�h�Ŏw��
$unTarget_filename = "*.mp3"
# �o�͂��郍�O�t�@�C����
$log_filename = "PS1_test_SLTX.log"
# ������̃��[�g�t�H���_
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# �����Ώۂ̃t�H���_�i�T�u�t�H���_���ΏۂɂȂ�j 
$path1 = $env_root + "MST"

# �Ώۃt�@�C���ꗗ���o�͂��钼�O�̌x���\��
$msg1 = $unTarget_filename + "�ȊO�̃t�@�C������" + $log_filename + "�ɏo�͂��܂�"
$msg2 = "�Ԉ���ċN�������Ȃ�Β��f���Ă�������"
Write-Output $msg1,$msg2

$msg3 = "���s����Ȃ��Y�܂���y���A���f����Ȃ�΂���ȊO�̕��������Ă�������"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "���f���܂�"
	exit
	}
Write-Output "���s���܂�"

# ���݂̃f�B���N�g���ɂ���t�@�C�����̂����A
# �g���q.mp3�����Ă��Ȃ��t�@�C���̂ݒ��o�擾����
# �t���p�X�t�t�@�C������PS1_test_SLTX.log�t�@�C���̒��ɏo�͂�����
# 2�x���s����ƌ��ɒǉ������̂ŁA���ӁB

# Tips
# ��-File�I�v�V������t���Ď��s����ƁA���ʂ���t�H���_�����O����A�t�@�C���̂ݕ\�������B
# ��-Filter�I�v�V������t���Ď��s����ƁA�t�H���_���E�t�@�C�������i�荞�񂾌��ʂ��\������A <=�t�H���_���擾�\
#   -Filter�̌�ɕ������ǉ�����ƁA���̕�����Ɉ�v�����t�@�C�����̂ݕ\�������B

# �t�@�C���������ݗp�̃X�g���[�����J���FNew-Object System.IO.StreamWriter()
$textfile = $env_root + $log_filename
$file = New-Object System.IO.StreamWriter($textfile, $true, [System.Text.Encoding]::GetEncoding("UTF-8"))
$file.WriteLine("--- ���o�Ώۂ̃t�@�C���ꗗ ---")

# �T�u�f�B���N�g�����܂ރf�B���N�g���̒�����(-Recurse)�A
# �t�@�C�����݂̂��擾��(-File)�A
# �g���q.mp3�ȊO�𒊏o����(-Exclude)�A
# �t�@�C���ɏo�͂���F$file.WriteLine()
$list = Get-ChildItem $path1 -File -Exclude $unTarget_filename -Recurse ;
foreach ($item in $list) {
	$file.WriteLine($item.FullName)
}

# �t�@�C�������F$file.Close()
$file.Close()