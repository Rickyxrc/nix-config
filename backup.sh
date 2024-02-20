#!/bin/sh

rm /home/ricky/archive-zipped/*

folderPath=/home/ricky/active

for folder in $(ls $folderPath); do
	zip -r /home/ricky/archive-zipped/$folder.zip $folderPath/$folder -x '*.direnv*' '*node_modules*'
done

folderPath=/home/ricky/archive

for folder in $(ls $folderPath); do
	zip -r /home/ricky/archive-zipped/$folder.zip $folderPath/$folder -x '*.direnv*' '*node_modules*'
done
