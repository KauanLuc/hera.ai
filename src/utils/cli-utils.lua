local cli_utils = {}

function cli_utils.add_description()
    return 'Adicione as informações da sua planta para que a Hera personalize as respostas com base nas condições específicas dela, garantindo recomendações mais precisas e eficazes.'
end

function cli_utils.save_as_html(text)
    local current_date = os.date('%d-%m-%Y-%H-%M-%S')
    return 'echo "'..text..'" > resposta-hera-'..current_date..'.html', 'response-hera-'..current_date..'.html'
end

function cli_utils.troubleshoot_description()
    return 'Hera te dá as dicas mais comuns para resolver os problemas da sua planta, com base no contexto e nos cuidados diários específicos '
end

return cli_utils