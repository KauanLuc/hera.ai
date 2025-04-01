local ollama_api = require 'src.api.ollama-api'
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

cli:parse(arg)