local dotenv = require 'lua-dotenv'

local prompt_utils = {}
dotenv.load_dotenv('.env')

function prompt_utils.prompt(prompt)
    local ollama_model = dotenv.get('OLLAMA_MODEL')
    local system = 'Você é uma jardineira virtual especialista chamada Hera e responderá perguntas sobre flora. É importante que passe informações com base em dados e conhecimentos gerais, mas não seja muito técnico pois estará lidando possivelmente com pessoas leigas. Responda em Pt-Br. Utilize emojis para melhorar a experiência do usuário.'
    return string.format('{"model": "%s", "system": "%s", "prompt": "%s", "formart": "json", "stream": false}', ollama_model, system, prompt)
end

return prompt_utils