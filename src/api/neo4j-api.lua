local json = require 'dkjson'
local bolt = require 'bolt'
local dotenv = require 'lua-dotenv'

local neo4j = {}
dotenv.load_dotenv('.env')

function neo4j.query(query, data)
    local principal_db = dotenv.get('NEO4J_PRINCIPAL')
    local credential_pass = dotenv.get('NEO4J_CREDENTIAL')
    bolt.init({scheme = 'basic', principal = principal_db, credentials = credential_pass})
    local response, err = bolt.query(query, data)
    
    if err then
        return nil, err
    end

    return response
end

return neo4j