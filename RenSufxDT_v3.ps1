# ����̃t�H���_�̃t�@�C�����̌���
# �t�@�C���쐬���������ă��l�[������
# �N�����ɃR���\�[�����烊�l�[���ΏۂƑΏۊO�̃t�@�C�������w��ł���

# ������̃��[�g�t�H���_
$env_root  = Split-Path $myInvocation.MyCommand.path

# �����Ώۂ̃t�H���_�i�T�u�t�H���_�͑ΏۊO�B�Ώۂɂ���Ȃ��-Recurse�I�v�V���������邱�Ɓj 
$target_folder = "\*" #��
$path1 = $env_root + $target_folder

# �����Ώۂ̃t�@�C����
# $Target_filename = "*.txt" #��
$Target_filename = $args[0]

# �����ΏۊO�̃t�@�C����
# $unTarget_filename = "RenSufxDT_v3.ps1" #��
$unTarget_filename = $args[1]

# Tips
# [�t�@�C���������l�[���@�t�@�C���쐬���ɒu��������](https://buralog.jp/powershell-filerename-by-creationtime/)
# [�t�@�C���̍쐬������X�V�������擾����](https://hosopro.blogspot.com/2016/11/powershell-get-itemproperty.html)

#	CreationTime   �t�@�C���쐬����
#	LastWriteTime  �ŐV����
#	LastAccessTime �A�N�Z�X����  

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
     $newName =  $_.Basename + $_.CreationTime.ToString("_yyyyMMdd-HHmmss") + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }