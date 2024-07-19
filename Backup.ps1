### Original Backup81101.ps1
### Original Creation date 2024/7/19 22:28
### Author Hiroyuki.Moriya

## Step1
## �o�b�N�A�b�v�Ώۂ̃t�@�C��(�ȉ��A<source>�Ɨ��L)���A
## �o�b�N�A�b�v��̃t�H���_(�ȉ��A<backup>�Ɨ��L)�փR�s�[����B
## �R�s�[���Ƀt�@�C������"_bkp"�̕�������T�t�B�b�N�X����B

# <source>�̃p�X�ƃt�@�C����
  $Source_Path = "D:\Users\HIROYUKI\SourceLibrary\"
  $Source_filename = "SourceFile.xlsx"
  $Source = $Source_Path + $Source_filename

# <backup>�̃p�X�ƃt�@�C����
   $Backup_path = "D:\Users\HIROYUKI\Downloads\WORK\"
   $Backup_filename = "SourceFile_bkp.xlsx"
   $Backup = $Backup_path + $Backup_filename

## Step2
## ���s���O�̌x���\��

$msg1 = $Source_filename + "��" + $Backup_path + "�t�H���_�[�Ƀo�b�N�A�b�v���܂�"
$msg2 = "�Ԉ���ċN�������Ȃ�Β��f���Ă�������"
Write-Output $msg1,$msg2

$msg3 = "���s����Ȃ��Y�܂���y���A���f����Ȃ�΂���ȊO�̕��������Ă�������"
$TypeIn = Read-Host $msg3
If($TypeIn -ne "Y"){
	Write-Output "���f���܂�"
	exit
	}
Write-Output "���s���܂�"

## Step3
## �R�s�[���s

Copy-Item -Path $Source -Destination $Backup 

## Step4
## <backup>�ɃR�s�[�����t�@�C���̃t�@�C���������l�[������B
## ���l�[�����ɁA�t�@�C�����̌��Ƀt�@�C���X�V���t���T�t�B�b�N�X���ă��l�[������B
## �����Ƀo�b�N�A�b�v�ς̏ꍇ�́A�G���[���b�Z�[�W"Rename-Item : ���ɑ��݂���t�@�C�����쐬���邱�Ƃ͂ł��܂���B"���\�������B

$LWT = Get-ItemPropertyValue -Path $Backup -Name LastWriteTime
$BSN = Get-ItemPropertyValue -Path $Backup -Name Basename
$EXT = Get-ItemPropertyValue -Path $Backup -Name Extension
$NewName =  $BSN + $LWT.ToString("yyyyMMdd-HHmmss") + $EXT

Rename-Item -Path $Backup -NewName $NewName