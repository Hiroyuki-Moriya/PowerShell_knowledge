# �X�V�����̏��Ƀ\�[�g���āA
# ���̏��ɔԍ���U��A�t�@�C�����̌��ɂ��ă��l�[������

# ���o�Ώۂ̃t�@�C�������C���h�J�[�h�Ŏw��
$target_filename = "*.txt"

# ������̃��[�g�t�H���_
#$env_root = "D:\Users\hogehoge\PS1_test\"
$env_root = "C:\Users\AVD_moriya\Desktop\PS1_test\"
# �����Ώۂ̃t�H���_�i�T�u�t�H���_�͑ΏۊO�B�Ώۂɂ���Ȃ��-Recurse�I�v�V���������邱�Ɓj 
$target_folder = "MST" #��
$path1 = $env_root + $target_folder

# Tips
# [PowerShell�Ńt�@�C�����X�V�����̌Â����ɕ\��](https://minus9d.hatenablog.com/entry/20130224/1361715645)
# [�I�u�W�F�N�g�̕��בւ�](https://docs.microsoft.com/ja-jp/powershell/scripting/samples/sorting-objects?view=powershell-7.2)
#    ���݂̃f�B���N�g�����̃T�u�f�B���N�g���ƃt�@�C�����ꗗ�\��������ɂ��čl���܂��B
#    LastWriteTime �ŕ��בւ�����AName �ŕ��בւ���ɂ́A���̂悤�ɓ��͂��܂��B
#        Get-ChildItem |
#          Sort-Object -Property LastWriteTime, Name |
#          Format-Table -Property LastWriteTime, Name

# [�t�@�C���������l�[���B�t�@�C�����̐擪�ɘA�Ԃ�t����](https://buralog.jp/powershell-file-rename/)
#    [string]$format = �g{0:0000}�h -f $counter
#       �u-f�v�I�v�V�������g���Ēl�̃t�H�[�}�b�g�����܂��B
#       �u1�v�Ȃ�u0001�v�A�u100�v�Ȃ�u0100�v�Ƃ����������Œl��$format�ϐ��ɓ��͂��܂��B
#

# [������t�H�[�}�b�g���Z�q](https://yanor.net/wiki/?PowerShell/���@/������t�H�[�}�b�g���Z�q)
#    0�v���[�X�z���_�[�i�w�肷�錅��0�p�f�B���O�j
#        "{0:00}"   -f 1      # 01    ����Ȃ�����0�p�f�B���O
#

# [���l�𕶎���ɕϊ�����](https://win.just4fun.biz/?PowerShell/���l�𕶎���ɕϊ�����)
#    ��  $a=100 , $b=200
#        $a + $b  �� ���� 300
#        [string]$a + [string]$b �� ���� 100200

$counter = 0
$files = Get-ChildItem -Path $path1 -File -Filter $target_filename
$files | Sort-Object LastWriteTime | forEach-object{
     [string]$format = "{0:0000}" -f $counter
     $newName = $_.Basename + "_"  + $format + $_.Extension
     Rename-Item -LiteralPath $_.FullName -NewName $newName
     $counter = $counter + 10
}
