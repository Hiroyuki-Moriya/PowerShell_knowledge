# �t�H���_���ɂ��鏈���Ώۃt�@�C����
# �X�V�����̏��ɔԍ���U��A�����ڔ������ɂ��ă��l�[������
# �����Ώۃt�@�C���͋N�����Ɏw��ł���

# ������̃��[�g�t�H���_
$env_root  = Split-Path $myInvocation.MyCommand.path

# �����Ώۂ̃t�H���_�i�T�u�t�H���_�͑ΏۊO�B�Ώۂɂ���Ȃ��-Recurse�I�v�V���������邱�Ɓj 
$target_folder = "\*" #��
$path1 = $env_root + $target_folder

# �����ΏۊO�̃t�@�C����
$unTarget_filename = "RenSufxNum_v2.ps1" #��

# �����������Ώۂ̃t�@�C�����ɂ���
# ����$args[0]���w�肳��Ă��Ȃ���Ώȗ��l"*.txt"�������Ώۂ̃t�@�C��������
$target_filename = $args[0]
If( $target_filename.Length -eq 0 ){
	$target_filename = "*.txt"
	}

$counter = 0
$files = Get-ChildItem -Path $path1 -File -Filter $target_filename -Exclude $unTarget_filename
$files | Sort-Object LastWriteTime | forEach-object{
     [string]$format = "{0:0000}" -f $counter
     $newName = $_.Basename + "_"  + $format + $_.Extension
     Rename-Item -LiteralPath $_.FullName -NewName $newName
     $counter = $counter + 10
}

exit 0