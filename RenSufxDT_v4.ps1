# Source name RenSufxDT_v4.ps1

# �]�p���͂ق� RenSufxDT_v2.ps1 �A�J�X�^�}�C�Y������ "��"�̕\�L����
# �T�t�B�b�N�X�����̂�RenSufx_v2.ps1 ����]�p

# ����̃t�H���_�̃t�@�C�����̌���
# �ڔ�����(��)�ƃt�@�C���X�V����(��)�����ă��l�[������i�t�@�C���R�s�[����ƍ쐬�������R�s�[�����ɑ����Ă��܂�����j
# ���l�[���ΏۂƑΏۊO�̃t�@�C�������w��ł���

# Process(0)
#  Process(1)��(2)�̋��ʂ̃Z�b�e�B���O
#

# ������̃��[�g�t�H���_
$env_root = "F:\NAS\�f�W�J�����r�f�I\�A���o��2024�N\" # ���J�X�^�}�C�Y����

# �����Ώۂ̃t�H���_�i�T�u�t�H���_�͑ΏۊO�B�Ώۂɂ���Ȃ��-Recurse�I�v�V���������邱�Ɓj 
$target_folder = "EOS7DMk2\*" #�� 
$path1 = $env_root + $target_folder

# �����ΏۊO�̃t�@�C���� (���L�Q�s����)
#   ��Œ�`����u�����Ώۂ̃t�@�C�����v�Ɋ܂܂��t�@�C�����ł���Ȃ��珈���ΏۊO�ɂ���t�@�C�������L�q����B
#   ����"null"�A�ł������Ƃ肠���� PowerShell�̃t�@�C����"RenSufxDT_v*.ps1"�̋L�ڂɂ��Ă���
$unTarget_filename = "RenSufxDT_v*.ps1" #�� ��

# �T�t�B�b�N�X�Ɏg�p����ڔ�����
$suffix = "_EOS7DMk2" #�� ���J�X�^�}�C�Y��������RenSufx_v2.ps1 ����]�p����


# Process(1)
#  JPG�������Ώۂɂ���
#

# �����Ώۂ̃t�@�C����
$Target_filename = "*.JPG" #�� <==�@�����Ώۊg���q���Q����̂ŁA*.JPG��*.CR2�ɏ��������Ă��ꂼ����s���邱�Ɓ@���J�X�^�}�C�Y����

$files = Get-ChildItem -Path $path1 -File -Include $Target_filename -Exclude $unTarget_filename
$files | forEach-object{
     $newName =  $_.Basename + $suffix + $_.LastWriteTime.ToString("_yyyyMMdd-HHmmss") + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }

# Process(2)
#  CR2�������Ώۂɂ���
#

# �����Ώۂ̃t�@�C����
$Target_filename = "*.CR2" #�� <==�@�����Ώۊg���q���Q����̂ŁA*.JPG��*.CR2�ɏ��������Ă��ꂼ����s����@���J�X�^�}�C�Y����

$files = Get-ChildItem -Path $path1 -File -Include $Target_filename -Exclude $unTarget_filename
$files | forEach-object{
     $newName =  $_.Basename + $suffix + $_.LastWriteTime.ToString("_yyyyMMdd-HHmmss") + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }


# Tips
# [�t�@�C���������l�[���@�t�@�C���X�V�����ɒu��������](https://buralog.jp/powershell-filerename-by-creationtime/)
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

# Tips
#  �ʐ^�����H���Ă��t�@�C�����̏����ŕ��΂��邽�߁A�{���͍X�V�����ł͂Ȃ��A�B�e�������g�����������B
#  �T���Ƃ���������������������̂ŁA�������{�Ɍ�����킵�悤�Ǝv���B
#    ���^�f�[�^���̎B�e�����������ƂɃt�@�C���̖��O/�쐬����/�X�V������ύX����PowerShell�X�N���v�g
#    https://github.com/t-asano/media-dater
