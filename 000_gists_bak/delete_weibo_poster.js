'use strict';

var s = document.createElement('script');
s.setAttribute(
  'src',
  'https://lib.sinaapp.com/js/jquery/2.0.3/jquery-2.0.3.min.js'
);
s.onload = function() {
  setInterval(function() {
    if (!$('a[action-type="feed_list_delete"]')) {
      $('a.next').click();
    } else {
      $('a[action-type="feed_list_delete"]')[0].click();
      $('a[action-type="ok"]')[0].click();
    }

    // scroll bottom let auto load
    $('html, body').animate({ scrollTop: $(document).height() }, 'slow');
  }, 800);
};
document.head.appendChild(s);

// 删除自己发过的微博
// 以 Chrome 浏览器为例，可以参照以下做法：
// 1. 复制上述代码；
// 2. 新开一个标签，进入微博“我的首页”；
// 3. 打开 chrome 的开发者工具 (macOS 下的快捷键是 cmd+opt+i, windows 是 F12 或者 ctrl+shift+i)；
// 4. 点击 Esc 打开 console 页面，把上述代码粘贴进去，回车。
//
// 注意：假如没法自动翻页，删除多页的微博，可以手动翻页，然后重复步骤 4。
