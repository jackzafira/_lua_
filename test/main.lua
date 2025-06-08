function foo()
    _ = {
        x = 0, y =0
    }
    return _
end

x = foo()

function print_table(t)
    local str = "{"
    for k, v in pairs(t) do
        -- Verifica se a chave é uma string (para adicionar aspas)
        if type(k) == "string" then
            str = str .. string.format("['%s'] = ", k)
        else
            str = str .. string.format("[%s] = ", k)
        end
        -- Verifica o tipo do valor
        if type(v) == "string" then
            str = str .. string.format("'%s', ", v)
        elseif type(v) == "table" then
            str = str .. print_table(v) .. ", "
        else
            str = str .. string.format("%s, ", tostring(v))
        end
    end
    -- Remove a vírgula e espaço extra no final, se existir
    if str:sub(-2) == ", " then
        str = str:sub(1, -3)
    end
    return str .. "}"
end


print(print_table(x))