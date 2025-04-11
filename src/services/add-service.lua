local neo4j_api = require 'src.api.neo4j-api'
local query_utils = require 'src.utils.query-utils'

local add = {}

function add.add(data)
    local plant_data = {}
    local context = string.lower(data.contexto or get_context(data.planta))
    local daily_care = string.lower(data.cuidados_diarios or get_daily_care(data.planta))

    if data.problema == nil or #data.problema == 0 then
        print('Digite quais problemas o(a) '..data.planta..' tem: (Digite "/sair" para finalizar)')
        while true do
            local problem = string.lower(io.read())
            if problem == '/sair' then
                break
            end

            table.insert(plant_data, tostring(problem))
        end
    else
        for _, v in pairs(data.problema) do
            table.insert(plant_data, tostring(v))
        end
    end

    plant_data.name = data.planta
    plant_data.context = context
    plant_data.daily_care = daily_care

    local response, err = neo4j_api.query(query_utils.add(plant_data), plant_data)
    if err then
        return print('Não foi possível adicionar a planta a base de dados. Erro: '..err)
    end

    print(data.planta..' adicionado(a) com sucesso')
end

function get_context(plant)
    print('Digite qual o contexto que o(a) '..plant..' vive: (Ex: Apartamento, luz difusa indireta etc)')
    return io.read()
end

function get_daily_care(plant)
    print('Digite quais são os cuidados diários com o(a) '..plant..': (Ex: Rega 1x por dia, poda todo mês etc)')
    return io.read()
end

return add