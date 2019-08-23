#!/usr/bin/bash

declare -A all_needed

all_needed=(
  ["python"]="2."
  ["scons"]="script: v"
  ["g++"]="g++"
  ["gcc"]="gcc"
  ["mysql"]="Ver"
  ["svn"]="version"
  # for Test
  #["svnia"]="version"
)

#################################################################

show_color_msg(){
  echo -e "\033[0$1m..\033[0m"
  echo -e "\033[0$1m..\033[0m"
  echo -e "\033[0$1m    ${2}\033[0m"
  echo -e "\033[0$1m..\033[0m"
  echo -e "\033[0$1m..\033[0m"
}

show_OK_msg(){
  show_color_msg 32 "${1}"
}

show_Error_msg() {
  show_color_msg 35 "${1}"
}

show_error_msg() {
  show_color_msg 31 "${1}"
}

show_info_msg(){
  show_color_msg 33 "${1}"
}

show_check_msg(){
  show_color_msg 34 "${1}"
}

function exit_me()
{
  show_error_msg "Start Check Env is Faild, PLease Check Env!!!"
  return 101
  exit
}

#################################################################

function python_check()
{
  `echo "#!/usr/bin/python"> test_python.py`
  `echo "import sys"> test_python.py`
  `echo "print(sys.version)">> test_python.py`
  python_status=`python test_python.py`
  if [[ $(echo ${python_status:0:8} | grep $2) ]]; then
    show_OK_msg $1" has Installed"
    return 0
  else
    show_Error_msg $1" is Not Installed, Please Install First"
    return 100
  fi
}

function has_installed()
{
  status=$($1 --version | grep "$2")
  if [[ $status ]]; then
    show_OK_msg $1" has Installed"
    return 0
  else
    python_check $1 "$2"
    python_check_result=$?
    if [[ $python_check_result > 0 ]]; then
      show_Error_msg $1" is Not Installed, Please Install First"
      return 102
      exit_me
    fi
  fi
}

function check_all_need()
{
  show_check_msg "Start Check Env is OK."
  for soft_name in $(echo ${!all_needed[*]})
  do
    has_installed $soft_name ${all_needed[$soft_name]}
    install_result=$?
    if [[ $install_result > 0 ]];then
      return 103
    fi
  done
  show_check_msg "Start Check Env is OK."
}

########################################################
function main()
{
  check_all_need
  check_result=$?
  if [[ $check_result > 0 ]]; then
    return $check_result
  fi
  init_result=$?
  return 0
}

main


