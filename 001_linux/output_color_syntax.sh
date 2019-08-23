#!/bin/bash

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

function echo_n()
{
  echo "."
  echo "."
  echo "       " $1
  echo "."
  echo "."
}

function echo_m()
{
  echo "       " $1
}

function echo_none()
{
  echo ""
}

function cur_system_color()
{
  echo_n "当前系统支持颜色"
  for fgbg in 38 48 ; do # Foreground / Background
    for color in {0..255} ; do # Colors
      # Display the color
      printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
      # Display 6 colors per lines
      if [ $((($color + 1) % 6)) == 4 ] ; then
        echo # New line
      fi
    done
    echo # New line
  done
}

function foreground_color()
{
  # Foreground color  test
  echo_n "前景色支持查询"
  for i in {16..21} {21..16};
  do
    echo -en "\e[38;5;${i}m#\e[0m"
  done;
  echo_none
}

function background_color()
{
  # background color test
  echo_n "背景色支持查询"
  for i in {16..21} {21..16};
  do
    echo -en "\e[48;5;${i}m \e[0m"
  done
  echo_none
}
#############################################


function common_color()
{
  echo_n "常用颜色展示 - 系统颜色测试"

  echo -e "\\033[0;31m此颜色为一号颜色 - 红"
  echo -e "\\033[0;32m此颜色为二号颜色 - 绿"
  echo -e "\\033[0;33m此颜色为三号颜色 - 黄"
  echo -e "\\033[0;34m此颜色为四号颜色 - 蓝"
  echo -e "\\033[0;35m此颜色为五号颜色 - 紫"
  echo -e "\\033[0;36m此颜色为六号颜色 - 青"
  echo -e "\\033[0;39m此颜色为九号颜色 - 白"
  echo_none
}

function common_bg_color()
{
  echo_n "常用字体背景颜色展示，范围 40 - 47"
  echo -e "\033[40;37m 黑底   白字 \033[0m"
  echo -e "\033[41;37m 红底   白字 \033[0m"
  echo -e "\033[42;37m 绿底   白字 \033[0m"
  echo -e "\033[43;37m 黄底   白字 \033[0m"
  echo -e "\033[44;37m 蓝底   白字 \033[0m"
  echo -e "\033[45;37m 紫底   白字 \033[0m"
  echo -e "\033[46;37m 天蓝底 白字 \033[0m"
  echo -e "\033[47;30m 白底   黑字 \033[0m"
  echo_none
}


function syntax_color_output()
{
  echo "."
  echo_n "颜色输出语法"
  echo "1. 使用 echo -e 命令"
  echo "2.  \033 或者 \e 或者 \x1B 作为转义开始符号（就像一般的转义符号是反斜线\），表示 字符"
  echo "3. 转移符号与颜色命令之间用 [ 分隔(放在一起的话\03331m，就分不清了，所以\033[31m )"
  echo "   样例 1"
  echo '     "38;5 表示设置前景色，82,198 是颜色值"，语法：`echo -e "\e[38;5;82mHello \e[38;5;198m World\e[0m"`'
  echo -e "     效果 \e[38;5;82mHello \e[38;5;198m World\e[0m"
  echo "   样例 2"
  echo '     "48;5 表示设置背景色，82,198 是颜色值", 语法：`echo -e "\e[48;5;82m Hello \e[48;5;198m World \e[0m"`'
  echo -e "     效果 \e[48;5;82m Hello \e[48;5;198m World \e[0m"

  echo "4. 常用面控制选项说明"
  echo "   \33[0m             关闭所有属性"
  echo "   \33[1m             设置高亮度"
  echo "   \33[4m             下划线"
  echo "   \33[5m             闪烁"
  echo "   \33[7m             反显"
  echo "   \33[8m             消隐"
  echo "   \33[30m — \33[37m 设置前景色"
  echo "   \33[40m — \33[47m 设置背景色"
  echo "   \33[nA             光标上移n行"
  echo "   \33[nB             光标下移n行"
  echo "   \33[nC             光标右移n行"
  echo "   \33[nD             光标左移n行"
  echo "   \33[y;xH           设置光标位置"
  echo "   \33[2J             清屏"
  echo "   \33[K              清除从光标到行尾的内容"
  echo "   \33[s              保存光标位置"
  echo "   \33[u              恢复光标位置"
  echo "   \33[?25l           隐藏光标"
  echo "   \33[?25h           显示光标"
  echo_none
}

function some_smaples()
{
  echo_n "常用样例示例"
  echo -e "\033[40;44m\033[1m Hello World \e[0m"
  echo -e "\033[41;32m 背景颜色设置；文字颜色字符串 \033[0m"
  echo -e "\033[41;36m 红底湖蓝色字体 \033[0m"
  echo -e "\033[31m 红字 \033[0m"
  echo -e "\033[34m 黄字 \033[0m"
  echo -e "\033[41;33m\033[1m 加粗红底黄字 \033[0m"
  echo -e "\033[41;37m 红底白字 \033[0m"
  echo -e "\033[31;43m\033[5m\033[4m 加粗黄底红字下划线闪烁 \033[0m"
  echo_none
}

######################################################

function main()
{
  # 1. 系统支持颜色展示
  cur_system_color
  # 2. 前景色展示
  foreground_color
  # 3. 背景色展示
  background_color
  # 4. 常用颜色展示
  common_color
  # 5. 常用背景色展示
  common_bg_color
  # 6. 颜色输出语法
  syntax_color_output
  # 7. 样例展示
  some_smaples
}

main

