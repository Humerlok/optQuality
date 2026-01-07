-- envia uma mensagem de texto para a estação de controle terrestre informando a qualidade do fluxo óptico

local enable
local healthy
local quality

function optQuality()

    if optical_flow:enabled() then

        enable = true
        gcs:send_text(6, "Optical Flow Ligado")

    else
        enable = false

    end

    if enable then
        healthy = optical_flow:healthy()
        quality = optical_flow:quality()
        gcs:send_text(6, "Health: " .. tostring(healthy))
        gcs:send_text(6, "Quality: " .. tostring(quality))
        -- Concatena a string "Quality: " com a representação em string do valor da variável quality. A função tostring() é usada para converter quality em uma string para que possa ser concatenada com outra string.
    end

end

gcs:send_text(6, "optQuality.lua rolando") --Envia um texto para a estação de controle terrestre (Ground Control Station, GCS) com um nível de severidade 6 (informativo).

function update()
    optQuality()
    return update, 3000 -- Executa a cada 3 segundos
end

return update()

-- Code by Renan Mandelo Oliveira