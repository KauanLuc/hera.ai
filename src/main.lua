local ollama_api = require 'src.api.ollama-api'
local neo4j_api = require 'src.api.neo4j-api'
local query_utils = require 'src.utils.query-utils'
local cli_utils = require 'src.utils.cli-utils'
local Lummander = require 'lummander'

local cli = Lummander.new{
    title = 'Hera - Sua jardineira virtual com IA',
    tag = 'hera',
    description = 'Obtenha conhecimentos, dicas, truques e salve-os com uma IA jardineira focada completamente em flora.',
    version = 'dev-1',
    author = 'KauanLuc <https://github.com/KauanLuc>'
}

cli:command('prom <prompt>', 'Faça uma pergunta sobre flora para a Hera')
    :action(function(parsed, command, app)
        print('🤖 Analisando questão... (Pode levar alguns instantes)')

        local status, response, err = ollama_api.gen(parsed.prompt)
        print('status code: '..status)
        if err then
            return error(err)
        end
        print(response)
    end)

cli:command('add <nome_da_planta>', cli_utils.add_description())
    :action(function(parsed, command, app)
        local data = {}
        local plant = string.lower(parsed.nome_da_planta)

        print('Digite qual o contexto que o(a) '..plant..' vive: (Ex: Apartamento, luz difusa indireta etc)')
        local context = string.lower(io.read())

        print('Digite quais são os cuidados diários com o(a) '..plant..': (Ex: Rega 1x por dia, poda todo mês etc)')
        local daily_care = string.lower(io.read())
        
        print('Digite quais problemas o(a) '..plant..' tem: (Digite "/sair" para finalizar)')
        while true do
            local problem = string.lower(io.read())
            if problem == '/sair' then
                break
            end

            table.insert(data, problem)
        end
        
        data.name = plant
        data.context = context
        data.daily_care = daily_care
        
        local response, err = neo4j_api.query(query_utils.add(data), data)

        if err then
            return print('Não foi possível adicionar a planta a base de dados. Erro: '..err)
        end
        print(plant..' adicionado(a) com sucesso')
    end)

cli:parse(arg)