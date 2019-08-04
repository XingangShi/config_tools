#!/usr/bin/bash

echo "."
echo "  GeekPanshi AUTO Release Server"
echo "."

echo "      1. Start - Compliy and relase to git Tencent "
echo "-- "
hexo clean && hexo generate && hexo d
echo "      1. End   - Compliy and relase to git Tencent "
echo "-- "

echo "      2. Start - Delete Github Dir all content"
echo "-- "
cd ./1_delpoy_git-github/ && git pull && ls -l | awk -F" " '{print $9}' | grep . | xargs -n1 -I {} rm -rf {} && cd ..
echo "      2. End   - Delete Github Dir all content"
echo "-- "

echo "      3. Start - Copy Tencent git to Github Dir "
echo "-- "
cd ./.deploy_git &&  ls -l | awk -F" " '{print $9}' | grep . | xargs -I {} cp -rf  {}  ../1_delpoy_git-github/ && cd ..
echo "      3. End   - Copy Tencent git to Github Dir "
echo "-- "

echo "      4. Start - Release all changes to Github "
echo "-- "
cd ./1_delpoy_git-github && git add . && date | xargs -I {} git commit -am "auto_commit by date of "{} && git push && cd ..
echo "      4. End    - Release all changes to Github "

echo "."
echo "  Release Done !!"
echo "."
