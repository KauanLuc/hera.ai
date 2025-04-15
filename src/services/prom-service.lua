local ollama_api = require 'src.api.ollama-api'
local cli_utils = require 'src.utils.cli-utils'
local markdown = require 'markdown'

local prom = {}

function prom.prom(data)
    print('🤖 Analisando questão... (Pode levar alguns instantes)')

    local status, response, err = ollama_api.gen(data.prompt)
    if err then
        return error(err)
    end

    if status ~= 200 then
        return
    end

    if data.html then
        return save_as_html(data.prompt, response)
    end

    print(response)
end

function save_as_html(question, response)
    local full_response = string.format([[**Sua Pergunta**: %s

    %s
    ]], question, response)
    local response_as_html = markdown(full_response)
    local command, filename = cli_utils.save_as_html(response_as_html)
    local response_was_saved = os.execute(command)

    if response_was_saved == false then
        return print('Não foi possível salvar a resposta como html')
    end

    return print('Resposta da Hera salva com sucesso. Nome do arquivo: '..filename)
end

return prom