GET = 0
POST = 0
VERTICAL = 0
LABEL = 1
BUTTON = 2
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

mappings = {
  { 
    method = GET, endpoint = '/',
    handler = function(request, params)
      _CreateSuccessResponse(request)
    end
  },
  { 
    method = GET, endpoint = '/hi/:name', handler = function(request, params) 
      _CreateSuccessResponse(request)
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


function main() 
  return _DrawTree(uiTree());
end

count = 0;

function cb()
    count = count + 1;
    _DrawTree(uiTree());
end

function uiTree() 
  return 
    {
      nodeType = 0,
      name  = 199,
      children = {
        {
          nodeType = LABEL,
          label= "The count in ".. count,
        },
        {
          nodeType = BUTTON,
          label = "Increase",
          click = function() count = count + 1; _DrawTree(uiTree()) end
        }
      }
    }
  
end
