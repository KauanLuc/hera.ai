local neo4j_api = require 'src.api.neo4j-api'
local ollama_api = require 'src.api.ollama-api'
local query_utils = require 'src.utils.query-utils'
local table_utils = require 'src.utils.table-utils'
local string_utils = require 'src.utils.string-utils'

local troubleshoot = {}

function get_problems(name)
    local response, err = neo4j_api.query(query_utils.problems(), {name = name})
    if err then
        return nil, err
    end

    return response, nil
end

function troubleshoot.troubleshoot(data)
    local plant_problems, err = get_problems(data.planta)
    if err then
        return error('Erro: '..err)
    end

    if #plant_problems == 0 then
        return print('Nenhuma planta com o nome "'..data.planta..'" encontrada.')
    end

    print('🤖 Analisando questão... (Pode levar alguns instantes)')
    local plant_problems_string = table_utils.problems2string(plant_problems)
    local status, response, err2 = ollama_api.gen(string_utils.troubleshoot_prompt()..plant_problems_string)
    print('status code: '..status)
    if err2 then
        return error('Erro: '..err2)
    end

    print(response)
end

return troubleshoot