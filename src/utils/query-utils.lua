local query_utils = {}

function query_utils.add()
    return 'MERGE (plant:Plant {name: $name, context: $context, daily_care: $daily_care, problems: $problems})'
end

return query_utils