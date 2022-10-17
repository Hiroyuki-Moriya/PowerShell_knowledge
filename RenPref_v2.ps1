# �����Ώۂ̃t�H���_���ɂ���Powshell�̃X�N���v�g(*.ps1)�������Ώۂɂ���
# �t�@�C�����ɐړ�������t������B

# ������̃��[�g�t�H���_
$env_root  = Split-Path $myInvocation.MyCommand.path

# �����Ώۂ̃t�H���_�i�T�u�t�H���_�͑ΏۊO�B�Ώۂɂ���Ȃ��-Recurse�I�v�V���������邱�Ɓj 
$target_folder = "\*" #��
$path1 = $env_root + $target_folder

# �����Ώۂ̃t�@�C����
$Target_filename = "*.ps1" #��

# �����ΏۊO�̃t�@�C����
$unTarget_filename = "RenPref_v2.ps1" #��

# ������ړ������ɂ���
# ����$args[0]���w�肳��Ă��Ȃ���Ώȗ��l[Test]��ړ������ɂ���
$prefix = $args[0]
If( $prefix.Length -eq 0 ){
	$prefix = "[Test]"
	}

# Tips
#  -Include �i�荞��  
#  -Exclude ���O
#  -Recurse Path�Ŏw�肵���f�B���N�g���Ƃ��̃T�u�f�B���N�g�����獀�ڂ��擾���邱�Ƃ��Ӗ�����Binclude��exclude�ƈꏏ�Ɏw�肷��B
#           ���̃p�����[�^�[���w�肳��Ă���Ƃ��́APath �p�����[�^�[�̖����̃A�X�^���X�N (*) �͏ȗ��\�B
#  ���
#    Recurse���w�肷��ƃT�u�f�B���N�g�����Ώۂɂ���̂ŁA�T�u�f�B���N�g����Ώۂɂ��Ȃ��ꍇ�́A
#    Recurse���w�肹���APath�̍Ō�� "\*" ������K�v������B  ��) "PS1_test\*"

$files = Get-ChildItem -Path $path1 -File -Include $Target_filename -Exclude $unTarget_filename
$files | forEach-object{
	 $newName = $prefix + $_.Basename + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }

exit 0