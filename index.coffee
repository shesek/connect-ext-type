DEFAULT_EXTENSIONS = '.json': 'application/json', '.html': 'text/html', '.txt': 'text/plain', '.xml': 'application/xml'

module.exports = (exts = DEFAULT_EXTENSIONS) -> (req, res, next) ->
  for ext, content_type of exts when ext is req.url.substr -ext.length
    req.url = req.url.substr 0, req.url.length-ext.length
    req.headers.accept = content_type
    break
  do next
