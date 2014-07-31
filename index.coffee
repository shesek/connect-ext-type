url = require 'url'

DEFAULT_EXTENSIONS = '.json': 'application/json', '.html': 'text/html', '.txt': 'text/plain', '.xml': 'application/xml'

module.exports = (exts = DEFAULT_EXTENSIONS) -> (req, res, next) ->
  parts = url.parse req.url
  for ext, content_type of exts when parts.pathname[-ext.length..] is ext
    parts.pathname = parts.pathname[...-ext.length]
    req.url = url.format parts
    req.headers.accept = content_type
    break
  do next
