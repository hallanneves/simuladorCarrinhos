function geraCarro(mundo,velocidade,tuplas)
	local pontos = {}
	local rodas = {}
	local shapes = {}
	local bodys = {}
	
	for _,aresta in ipairs(tuplas) do
		local x,y = math.cos(math.rad(aresta.angulo))*aresta.distancia,math.sin(math.rad(aresta.angulo))*aresta.distancia
		--x,y = body:getWorldPoints(x,y)
		table.insert(pontos,{x=x,y=y})
	end

	local body = love.physics.newBody(mundo,0,0,"dynamic")
	local centroX,centroY = body:getX(),body:getY()
	print("centroX = "..centroX.." centroY = "..centroY)
	local shape = love.physics.newPolygonShape(0,0,pontos[1].x,pontos[1].y,pontos[2].x,pontos[2].y)
	local fixture = love.physics.newFixture(body, shape, 1)
	fixture:setFilterData(2,1,-1)
	table.insert(shapes,shape)
	table.insert(bodys,body)

	for i=2,6 do 
		local novoShape,mediaX,mediaY
		if i<6 then 
			novoShape = love.physics.newPolygonShape(0,0,pontos[i].x,pontos[i].y,pontos[i+1].x,pontos[i+1].y)
			mediaX,mediaY = (centroX*3+pontos[i].x+pontos[i+1].x)/3,(pontos[i+1].y+centroY*3+pontos[i].y)/3
		else
			novoShape = love.physics.newPolygonShape(0,0,pontos[i].x,pontos[i].y,pontos[1].x,pontos[1].y)
			mediaX,mediaY = (centroX*3+pontos[i].x+pontos[1].x)/3,(pontos[1].y+centroY*3+pontos[i].y)/3
		end
		print("mediaX = "..mediaX.." mediaY = "..mediaY)
		
		local novoFixture = love.physics.newFixture(body, novoShape, 1)
		novoFixture:setFilterData(2,1,-1)
		--print("novo x = "..novoBody:getX().." novo y = "..novoBody:getY())

		--if i == 6 then 
--			local novoJoint = love.physics.newWeldJoint(novoBody, body,mediaX,mediaY, 0, 0, false)
--		end
		table.insert(shapes,novoShape)

		if tuplas[i].raioRoda>2 then
			table.insert(rodas,geraRoda(mundo,tuplas[i].raioRoda,converteVelocidade(velocidade),pontos[i].x,pontos[i].y,body))
		else
			print("raio roda era "..tuplas[i].raioRoda)
		end
	end
	body:setX(400)
	body:setY(200)

	return {body=body,shapes=shapes,rodas=rodas}
end

function geraRoda(mundo,raio,velocidade,posx,posy,bodyPai)
	posx,posy = bodyPai:getWorldPoints(posx,posy)
	--print("criou roda em "..posx..","..posy)
	local body = love.physics.newBody(mundo,posx,posy,"dynamic")
	local shape = love.physics.newCircleShape(raio)
	print("criou roda com raio "..raio)
	local fixture = love.physics.newFixture(body,shape,2) --1 eh a densidade
	fixture:setFilterData(2,1,-1)
	local joint = love.physics.newDistanceJoint(body, bodyPai, posx,posy,posx,posy, false)
	return {raio = raio, velocidade = velocidade*0.5, body = body,shape = shape}
end

function converteVelocidade(velocidade,raio)
	return velocidade --VAI COSTAO
end
