/**
nodejs 8 case list, Q:
1. which cases you can get the request() error print info?
2. which cases you can get the response() error print info?
NOTICE:
nodejs response() will ever emit an error ! all error emit by request(), such as:
1. error in request()  --> error request info, no response info;
2. error in response() --> error request info, has normal response end info.
**/

const https = require("https")

const url = "https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz"

const req = https.get(url, res => {
  res.on('data', data => console.log(data.length))
  res.on('end', () => console.log('res end'))
  res.on('error', err => console.log('res error', err))
  res.on('close', err => console.log('res close'))

  // 1. setImmediate(() => req.abort())
  // 2. setImmediate(() => req.destroy())
  // 3. setImmediate(() => req.destroy(new Error('Stack')))
  // 4. setImmediate(() => res.destroy())
  // 5. setImmediate(() => res.destroy(new Error('Stack')))
})

req.on('error', err => console.log('req error', err))
req.on('close', () => console.log('req close'))
// 6. setImmediate(() => req.abort())
// 7. setImmediate(() => req.destroy())
// 8. setImmediate(() => req.destroy(new Error('Stack')))

/**
1. setImmediate(() => req.abort())
req close
res end
res close
2. setImmediate(() => req.destroy())
req close
res end
res close
3. setImmediate(() => req.destroy(new Error('Stack')))
req error Error: Stack
req close
res end
res close
4. setImmediate(() => res.destroy())
req close
res end
res close
5. setImmediate(() => res.destroy(new Error('Stack')))
req error Error: Stack
req close
res end
res close
6. setImmediate(() => req.abort())
req error { Error: socket hang up
req close
7. setImmediate(() => req.destroy())
req error { Error: socket hang up
req close
8. setImmediate(() => req.destroy(new Error('Stack')))
req error Error: Stack
req close
**/
