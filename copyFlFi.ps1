# ������̃��[�g�t�H���_
$env_root = "C:\Users\hogehoge\Desktop\PS1_test\"
# copy from to �̃t�H���_��
$copyFrom = "NAS"
$copyFrom_folder = $env_root + $copyFrom
$copyto = "MST"
$copyTo_folder = $env_root + $copyto

# �Ώۃt�@�C���ꗗ���o�͂��钼�O�̌x���\��
$msg1 = $copyFrom + "�t�H���_����" + $copyto + "�փt�@�C�������ׂăR�s�[���܂�"
$msg2 = "�Ԉ���ċN�������Ȃ�Β��f���Ă�������"
Write-Output $msg1,$msg2

$msg3 = "���s����Ȃ��Y�܂���y���A���f����Ȃ�΂���ȊO�̕��������Ă�������"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "���f���܂�"
	exit
	}
Write-Output "���s���܂�"

# MST�t�H���_���Ȃ����Ƃ��O��ŁA�t�H���_����NAS����MST�ɕς��Ă��̔z���̃t�@�C�������ׂăR�s�[����
# MST�t�H���_������ƁAMST�z����NAS�t�H���_������Ă��܂����ANAS�z���̃t�H���_�\����t�@�C���̓R�s�[�ł���
Remove-item -Path $copyTo_folder -Recurse -Force
Copy-Item -Path $copyFrom_folder -destination $copyTo_folder -Recurse
#
# �����n�����Ɉ�񂾂����s���邽�߂ɍ쐬���Ă���B
# ���ȏ�g�p�����ꍇ�A�V�K�ǉ��͂ł��邪�A�l�o�ō폜��X�V�����̌��ɂߍ�Ƃ����邱�ƂɂȂ�̂ŁA����PS1�X�N���v�g�͂���Ɍ����ĂȂ�
# ����Ȃ��t�H���_���R�s�[����̂Ŏ�ŏ�������
# �㏑�����Ȃ��悤�� -Force �I�v�V�����͊O����