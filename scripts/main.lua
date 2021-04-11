GET = 0
POST = 0
-- on this endpoint
-- lua will specify the handler for the request
-- either lua itself or the c++
em = {}
em.requestBuilder = {
  _CreateSuccessResponse = function() end,
  _AppendHeader = function() end,
  _Body = function() end,
  _Done = function() end,
}
em = {
  
}

mappings = {
  { 
    method = GET, endpoint = '/',
    handler = function(reqPtr)
      return "Hello from lua" 
    end
  },
  { 
    method = GET, endpoint = '/hi/:name', handler = function(params) 
      return "Hello " .. params['name']  
    end
  }
}

function defaultRequestHandler()
  -- call the right handler for the incoming request passed by the cpp host
  -- with the params relevant to selected persona
end

serverConfig = {
  hostname = 'localhost',
  port = 4200
}
