local argparse = require 'argparse'
local prom_service = require 'src.services.prom-service'
local add_service = require 'src.services.add-service'
local troubleshoot_service = require 'src.services.troubleshoot-service'
local cli_utils = require 'src.utils.cli-utils'

local hera = argparse(){
    name = 'hera',
    description = 'IA jardineira especializada em flora',
    epilog = 'Para mais informações e para contribuição, veja <https://github.com/KauanLuc/hera.ai>'
}

local prom = hera:command('prom', 'Faça uma pergunta sobre flora para a Hera')
prom:argument('prompt', 'Pergunta ou dica a ser respondida pela Hera')
prom:flag('--html', 'Imprime a resposta em um arquivo HTML')
prom:action(function(args) prom_service.prom(args) end)

local add = hera:command('add', cli_utils.add_description())
add:summary('Salve suas plantas no banco de dados para consultas futuras')
add:argument('planta', 'Planta a ser adiciona ao banco de dados')
add:option('-c --contexto', 'Contexto na qual a planta vive')
add:option('-d --cuidados-diarios', 'Seus cuidados diários com a planta')
add:option('-p --problema', 'Problemas que sua planta possui'):count('*')
add:action(function(args) add_service.add(args) end)

local troubleshoot = hera:command('solucionar', cli_utils.troubleshoot_description())
troubleshoot:argument('planta', 'Planta aos problemas serem solucionados')
troubleshoot:action(function(args) troubleshoot_service.troubleshoot(args) end)

local args = hera:parse()