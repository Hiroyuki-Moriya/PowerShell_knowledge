# �X�N���v�g���s�O�Ɏd�l�ƒ��ӎ�����\�����āA
# ���s(�X�N���v�g�����̑��s)�����f������

$msg1 = "���̃X�N���v�g�́i�ȒP�Ȏd�l�j�����s���܂�"
$msg2 = "�Ԉ���ċN�������Ȃ�Β��f���Ă�������"
Write-Output $msg1,$msg2

$msg3 = "���s����Ȃ��Y�܂���y���A���f����Ȃ�΂���ȊO�̕��������Ă�������"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "���f���܂�"
	exit
	}
Write-Output "���s���܂�"