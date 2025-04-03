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

cli:command('-p <prompt>', 'Faça uma pergunta sobre flora para a Hera')
    :action(function(parsed, command, app)
        print('🤖 Analisando questão... (Pode levar alguns instantes)')

        local status, response, err = ollama_api.gen(parsed.prompt)
        print('status code: '..status)
        if err then
            return error(err)
        end
        print(response)
    end)

    cli:command('add <plant_name>', cli_utils.add_description())
    :action(function(parsed, command, app)
        local plant = string.lower(parsed.plant_name)

        print('Digite qual o contexto que o(a) '..plant..' vive:')
        local context = string.lower(io.read())
        
        print('Digite quais são os cuidados diários com o(a) '..plant..':')
        local daily_care = string.lower(io.read())
        
        print('Digite quais problemas o(a) '..plant..' tem:')
        local problems = string.lower(io.read())
        
        local data = {
            name = plant,
            context = context,
            daily_care = daily_care,
            problems = problems
        }

        local response, err = neo4j_api.query(query_utils.add(), data)

        if err then
            print('Não foi possível adicionar a planta a base de dados. Erro: '..err)
        end
        print(plant..' adicionado(a) com sucesso')
    end)

cli:parse(arg)