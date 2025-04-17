local query_utils = {}

function query_utils.add(data)
    local query = 'MERGE (plant:Plant {name: $name, context: $context, daily_care: $daily_care})'

    for _, v in pairs(data) do
        if _ ~= 'name' and _ ~= 'context' and _ ~= 'daily_care' then
            local prefix = string.gsub(v, "%s+", "_")
            query = query..string.format('\nMERGE (%s:Problem {name: $%s})\nMERGE (plant)-[:HAS_PROBLEM]->(%s)', prefix, _, prefix)
        end
    end

    return query
end

function query_utils.problems()
    return 'MATCH (plant:Plant {name: $name})-[:HAS_PROBLEM]->(problem:Problem) RETURN plant.name, plant.context, plant.daily_care, problem.name'
end

return query_utils