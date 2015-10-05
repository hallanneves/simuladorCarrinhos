function geraCarro(mundo,velocidade,tuplas)
	local body = love.physics.newBody(mundo,50,50,"dynamic")
	local pontos = {}
	local rodas = {}
	for _,aresta in ipairs(tuplas) do
		local x,y = 50+math.sin(math.cos(aresta.angulo))*aresta.distancia,50+math.sin(math.sin(aresta.angulo))*aresta.distancia
		table.insert(pontos,x)	
		table.insert(pontos,y)
		if aresta.raioRoda>0 then
			table.insert(rodas,geraRoda(mundo,aresta.raioRoda,converteVelocidade(velocidade),x,y,body))
		end
	end
	local shape = love.physics.newPolygonShape(pontos)
	return {body=body,shape=shape,rodas=rodas}

end

function geraRoda(mundo,raio,velocidade,posx,posy,bodyPai)
	local body = love.physics.newBody(mundo,posx,posy,"dynamic")
	local shape = love.physics.newCircleShape(raio)
	local fixture = love.physics.newFixture(body,shape,1) --1 eh a densidade
	local joint = love.physics.newDistanceJoint( body, bodyPai, posx, posy, posx, posy, false)
	return {raio = raio, velocidade = velocidade, body = body}
end

function converteVelocidade(velocidade,raio)
	return velocidade --VAI COSTAO
end
