$msg1 = "テスト用環境のルートフォルダPS1_testとテストデータを配置するフォルダNASを作成します"
$msg2 = "間違って起動したならば中断してください"
Write-Output $msg1,$msg2

$msg3 = "実行するならばYまたはyを、中断するならばそれ以外の文字を入れてください"
$input = Read-Host $msg3
If($input -ne "Y"){
	Write-Output "中断します"
	exit
	}
Write-Output "実行します"

# テスト用環境のルートフォルダtestとコピー元テストデータを配置するフォルダNASを作成する
mkdir PS1_test/NAS
cd NAS
mkdir ♪artist/♪album1
mkdir ♪artist/♪album2
mkdir ♪アーティスト/♪アルバム1
mkdir ♪アーティスト/♪アルバム2
mkdir ♭artist/album1
mkdir ♭artist/album2
#
#出来上がりイメージ
#C:\USERS\hogehoge\DESKTOP\PS1_test
#├─MST
#└─NAS
#    ├─♪artist
#    │  ├─♪album1
#    │  └─♪album2
#    ├─♪アーティスト
#    │  ├─♪アルバム1
#    │  └─♪アルバム2
#    └─♭artist
#        ├─album1
#        └─album2
#
#
