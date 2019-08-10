
#CommentFlag //

//Change Comment flag from  # to  //

// SRC：
//
// 1. Home： https://www.autohotkey.com/
//
// 2. Chinses Doc： http://ahkcn.sourceforge.net/docs/AutoHotkey.htm
//
// 3. W3C keyboard Info： https://www.w3.org/TR/uievents-code/ https://www.w3.org/TR/uievents-key/


// version Infos:
//
// v 1.0 : init.
//
// v 1.1 : init HHKB mode.
//
// v 1.2 : fix bug, ` can't be insted,  back quote should be instead by {``}。

Shift & Backspace::send {|}

\::Backspace

Backspace::\

//LCtrl::CapsLock
//CapsLock::LCtrl

//LWIN::LAlt
//LAlt::Lwin

LCtrl & H::send {Left}
LCtrl & J::send {Down}
LCtrl & K::send {Up}
LCtrl & L::send {Right}

Up::Up

Up & A::send {Media_Prev}
Up & S::send {Volume_Down}
Up & D::send {Media_Next}
Up & W::send {Volume_Up}
Up & F::send {Volume_Mute}
Up & G::send {Media_Play_Pause}

Up & [::send {Up}
Up & '::send {Right}
Up & ;::send {Left}
Up & ?::send {Down}

Up & 1::send {F1}
Up & 2::send {F2}
Up & 3::send {F3}
Up & 4::send {F4}
Up & 5::send {F5}
Up & 6::send {F6}
Up & 7::send {F7}
Up & 8::send {F8}
Up & 9::send {F9}
Up & 0::send {F10}
Up & -::send {F11}
Up & =::send {F12}


Up & \::send {Delete}
Up & Backspace::send {Insert}

Up & I::send {PrintScreen}
Up & P::send {Pause}
Up & K::send {Home}
Up & L::send {PgUp}
Up & .::send {PgDn}
Up & ,::send {End}
Up & O::send {ScrollLock}

Up & H::send {*}
Up & J::send {/}
Up & N::send {+}
Up & M::send {-}


Up & Tab::send {CapsLock}

RAlt::send {RWin}
RControl::send {RAlt}

Up & RWin::send {Media_Stop}


Up & Insert::send {~}
Up & Delete::send {``}


Up & Escape::send {``}
Up & Q::send {~}

Up & E::send {``}
Up & R::send {~}
