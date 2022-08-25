# ����̃t�H���_�̃t�@�C�����̌���
# �t�@�C���쐬���������ă��l�[������


# ������̃��[�g�t�H���_
$env_root = "D:\Users\hogehoge\PS1_test\" #��
# �����Ώۂ̃t�H���_�i�T�u�t�H���_�͑ΏۊO�B�Ώۂɂ���Ȃ��-Recurse�I�v�V���������邱�Ɓj 
$target_folder = "ENV" #��
$path1 = $env_root + $target_folder

# Tips
# [�t�@�C���������l�[���@�t�@�C���쐬���ɒu��������](https://buralog.jp/powershell-filerename-by-creationtime/)
# [�t�@�C���̍쐬������X�V�������擾����](https://hosopro.blogspot.com/2016/11/powershell-get-itemproperty.html)

#	CreationTime   �t�@�C���쐬����
#	LastWriteTime  �ŐV����
#	LastAccessTime �A�N�Z�X����

$files = Get-ChildItem -Path $path1 -File
$files | forEach-object{
     $newName =  $_.Basename + $_.CreationTime.ToString("_yyyyMMdd-HHmmss") + $_.Extension
	 Rename-Item -LiteralPath $_.FullName -NewName $newName
 }