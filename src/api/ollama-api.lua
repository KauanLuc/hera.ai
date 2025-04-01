local json = require('dkjson')
local http = require('socket.http')
local ltn12 = require('ltn12')
local prompt_utils = require('src.utils.prompt-utils')

local ollama = {}

function ollama.gen(prompt)
    local OLLAMA_URL = 'http://localhost:11434/api/generate'
    local request = prompt_utils.prompt(prompt)
    local response_body = {}

    http.TIMEOUT = nil
    local response, status, headers = http.request{
        url = OLLAMA_URL,
        method = 'POST',
        headers = {
            ['Content-Type'] = 'application/json',
            ['Content-Length'] = tostring(#request)
        },
        source = ltn12.source.string(request),
        sink = ltn12.sink.table(response_body)
    }

    local response_json = table.concat(response_body)
    local decoded_response, pos, err = json.decode(response_json)

    if decoded_response then
        return status, decoded_response.response, nil
    end

    return status, nil, err
end

return ollama