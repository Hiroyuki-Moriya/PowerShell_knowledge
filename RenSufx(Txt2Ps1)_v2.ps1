# Powshell�̃X�N���v�g(*.ps1)�����[������Ƌ��ۂ���邵�A����Ď��s�����̂͊�Ȃ��̂ŁA
# �g���q(.ps1)�̌��ɂ���ɐڔ�����(.txt)��t�����āA���Q�������B
# ���Q�������X�N���v�g(*.ps1.txt)�����ɖ߂�(*.ps1)
# ��@test.ps1.txt �� test.ps1
# ���l�[���Ώۂ�(*.ps1.txt)�ɍi�荞��

# ������̃��[�g�t�H���_
$env_root  = Split-Path $myInvocation.MyCommand.path

# �����Ώۂ̃t�H���_�i�T�u�t�H���_�͑ΏۊO�B�Ώۂɂ���Ȃ��-Recurse�I�v�V���������邱�Ɓj 
$target_folder = "\*" #��
$path1 = $env_root + $target_folder

# �����Ώۂ̃t�@�C����
$Target_filename = "*.ps1.txt" #��

# Tips
#  -Include �i�荞��  
#  -Exclude ���O
#  -Recurse Path�Ŏw�肵���f�B���N�g���Ƃ��̃T�u�f�B���N�g�����獀�ڂ��擾���邱�Ƃ��Ӗ�����Binclude��exclude�ƈꏏ�Ɏw�肷��B
#           ���̃p�����[�^�[���w�肳��Ă���Ƃ��́APath �p�����[�^�[�̖����̃A�X�^���X�N (*) �͏ȗ��\�B
#  ���
#    Recurse���w�肷��ƃT�u�f�B���N�g�����Ώۂɂ���̂ŁA�T�u�f�B���N�g����Ώۂɂ��Ȃ��ꍇ�́A
#    Recurse���w�肹���APath�̍Ō�� "\*" ������K�v������B  ��) "PS1_test\*"

$files = Get-ChildItem -Path $path1 -File -Include $Target_filename
$files | forEach-object{
     $newName = $_.Basename #�� $_.Basenam�̒��Ɋg���q(ps1)�������Ă���̂ŁA$_.Extension�̌��������Ȃ�
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }

exit 0