# PowerShellを使ったフォルダとファイル操作
### 2022/8/12 
* mkNASdir.ps1  開発環境のディレクトリを作成する初歩的なスクリプト
* copyFlFi.ps1  フォルダ構造ごとファイルをコピーするスクリプト
* selectMP3.ps1 抽出したいファイル名の一覧をログファイルの出力するスクリプト
---
### 2022/8/15
* conGoExit.ps1 スクリプト実行をするかやめるか警告を出すスクリプト（既存スクリプトに反映）
---
### 2022/8/18（初期登録）
* SltxMP3.ps1   抽出対象外を指定してファイル名の一覧の一覧をログファイルの出力するスクリプト
* DelM3u.ps1    対象ファイルを削除するスクリプト
*　             汎用性を持たせるためパス、対象ファイル名などをパラメータ化して既存スクリプトに反映
---
### 2022/8/23
* RenPref.ps1  接頭文字を付けて改名（リネーム）するスクリプト
* RenSufx.ps1  接尾文字を付けて改名（リネーム）するスクリプト
* FileName.ps1 フルパス付ファイル名、ファイル名、拡張子なしナイル名、拡張子、更新日時を表示するスクリプト（テスト用）
* *.ps1        汎用性を持たせるため処理対象のフォルダをパラメータ化して既存スクリプトに反映
---
### 2022/8/25
* RenSufx(ps1toTxt).ps1 拡張子(.ps1)の後ろにさらに接尾文字(.txt)を付加して、無害化するスクリプト
* RenSufx(Txt2Ps1).ps1  無害化したスクリプト(*.ps1.txt)を元に戻す(*.ps1)
* RenSufxDT.ps1         ファイル名の後ろにファイル作成日時をつけてリネームする
---
### 2022/8/26
* RenSufxNum.ps1 更新日時の順に番号を振り、それを接尾文字にしてリネームするスクリプト
---
### 2022/10/13 実用に合わせて改造していくため参考資料を収集
[参考 Windows PowerShell 入門](https://codezine.jp/article/corner/10)  
[参考 Windows PowerShell 活用編](https://codezine.jp/article/corner/251)  
[参考 Windows PowerShell コマンドレットのヘルプ](https://forsenergy.com/ja-jp/windowspowershellhelp/html/7908faf0-0e08-443d-8060-aac911e5a7e0.htm)  
---
### 2022/10/14 このバージョンから環境パスを取得するように変更
* RenSufxDT_v2.ps1 ファイル作成日時をつけてリネームする。リネーム対象と対象外のファイル名を指定できる
* ConsoleIn.ps1 Powershellスクリプトに引数を渡す
* call_ps1_Parent.ps1 処理１スクリプトと処理２スクリプトを呼び出すスクリプト
** call_ps1_Child_1.ps1 処理１のスクリプト（引数の文字列をテキストファイルに書き出す）
** call_ps1_Child_2.ps1 処理２のスクリプト（書き出したファイル内容を読み出す）
* call_Note_Parent.ps1 処理１スクリプトと外部プログラムを呼び出すスクリプト
* RenSufxDT_v3.ps1 ファイル作成日時をつけてリネームする。起動時にコンソールからリネーム対象と対象外のファイル名を指定できる
* call_RenSufx.ps1 親スクリプト。RenSufxDT_v3.ps1にリネーム対象と対象外のファイル名を指定して起動する
* RenSufx(ps1toTxt)_v2.ps1 無害化対象を*.ps1とするが、自分自身RenSufx(ps1toTxt)_v2.ps1は無害化対象外にする
* RenSufx(Txt2Ps1)_v2.ps1 無害化したスクリプト(*.ps1.txt)を元に戻すと(*.ps1.ps1)だったが正しくした(*.ps1)
---
### 2022/10/17
* RenPref_v2.ps1 接頭文字をつけてリネームする。接頭文字は実行時に指定できる
* RenSufx_v2.ps1 接尾文字をつけてリネームする。接尾文字は実行時に指定できる
---
### 2022/10/18
* RenSufxNum.ps1 更新日時の順に番号を振り、それを接尾文字にしてリネームする。処理対象ファイルは起動時に指定できる
