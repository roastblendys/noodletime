#!/bin/bash

#ファイル名の入力を待つ
echo -n "縮小元となる 1024x1024 アイコンのファイル名(拡張子なし):"
read filename

#アイコンサイズ一覧(px)
array=(29 40 50 57 58 72 76 80 87 100 114 120 144 152 180)

for i in "${array[@]}"
do
	sips -Z $i ${filename}.png --out ${filename}_${i}x${i}.png
done
