function geraCarro(mundo,velocidade,tuplas)
	local body = love.physics.newBody(mundo,50,50,"dynamic")
	local pontos = {}
	local rodas = {}
	for _,aresta in ipairs(tuplas) do
		local x,y = 50+math.sin(math.cos(aresta.angulo))*aresta.distancia*0.5,50+math.sin(math.sin(aresta.angulo))*aresta.distancia*0.5
		table.insert(pontos,x)	
		table.insert(pontos,y)
		if aresta.raio>0 then
			table.insert(rodas,geraRoda(aresta.raio,converteVelocidade(velocidade),x,y,body))
		end
	end
	local shape = love.physics.newPolygonShape(pontos)
	return {body=body,shape=shape,rodas=rodas}

end

local function geraRoda(raio,velocidade,posx,posy,bodyPai)
	local body = love.physics.newBody(mundo,posx,posy,"dynamic")
	local shape = love.physics.newCircleShape(raio)
	local fixture = love.physics.newFixture(body,shape,1) --1 eh a densidade
	local joint = love.physics.newDistanceJoint( body, bodyPai, posx, posy, posx, posy, false)
	return {raio = raio, velocidade = velocidade, body = body}
end

local function converteVelocidade(velocidade,raio)
	return velocidade --VAI COSTAO
end