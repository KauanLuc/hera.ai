local cli_utils = {}

function cli_utils.add_description()
    return 'Adicione as informações da sua planta para que a Hera personalize as respostas com base nas condições específicas dela, garantindo recomendações mais precisas e eficazes.'
end

function cli_utils.save_as_html(text)
    local current_date = os.date('%d-%m-%Y-%H-%M-%S')
    return 'echo "'..text..'" > resposta-hera-'..current_date..'.html', 'response-hera-'..current_date..'.html'
end

return cli_utils