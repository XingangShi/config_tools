#!/usr/bin/bash
echo "A simple one hundred thousand dict install for using by local"
echo "."
echo "1. Install the dict to ~/simple_dict"
rm -rf ~/simple_dict
git clone https://github.com/geekpanshi/simple_dict.git ~/simple_dict
echo "."
echo "2. Alias the abc to the dict exe"
echo "   such as \"$ alias abc='python ~/simple_dict/abc.py'\""
echo "."
echo "3. Test the dict, using as: abc search_world."
echo "   such as \"$ abc python\""
echo "   such as \"$ abc 编程\""
echo "."
echo "4. OK, Enjoy yourself"
