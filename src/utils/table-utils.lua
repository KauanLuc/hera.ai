local table_utils = {}

function table_utils.problems2string(t)
    local internal_string = ''
    internal_string = internal_string..t[1]['plant.name']..': '
    for i = 1, #t do
        internal_string = internal_string..t[i]['problem.name']..';'
    end

    internal_string = internal_string..'Contexto em que vive: '..t[1]['plant.context']..';'
    internal_string = internal_string..'Cuidados diários que tenho: '..t[1]['plant.daily_care']..';'

    return internal_string
end

return table_utils