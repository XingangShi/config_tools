#!/usr/bin/env python
# -*- coding: utf-8 -*-
import hmac
import hashlib
import json
import time


input = {
    "active_id": 81,
    "players_name": [
      u"我是测试一呀",
      u"bb",
      u"ceaf"
    ],
    "ts": int(time.time())
}


def get_sign(securetkey, *inputdata):
    input = ''.join(inputdata)
    sign_calc = hmac.new(securetkey, input, hashlib.md5).hexdigest()
    return sign_calc


if __name__ == "__main__":
  input["sign"] = get_sign(b"45fda22435f89f22f2ce6756a3cf32c4", str(input["players_name"]), str(input["active_id"]), str(input["ts"]))

  print(json.dumps(input, sort_keys=True, indent=4).decode("unicode-escape"))
