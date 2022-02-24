local app = {}

local cjson = require("cjson")

--------------------------------------------------------------------------------
-- Response
--------------------------------------------------------------------------------
function app.response(msg)
  ngx.status = ngx.HTTP_OK
  ngx.say(msg)

  return ngx.exit(ngx.HTTP_OK)
end

--------------------------------------------------------------------------------
-- JSON Response
--------------------------------------------------------------------------------
function app.json_response(data)
  ngx.status = ngx.HTTP_OK
  ngx.header.content_type = "application/json; charset=utf-8"
  ngx.say(cjson.encode(data))

  return ngx.exit(ngx.HTTP_OK)
end

return app
