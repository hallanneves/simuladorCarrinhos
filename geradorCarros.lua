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
	--print("centroX = "..centroX.." centroY = "..centroY)
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
		--print("mediaX = "..mediaX.." mediaY = "..mediaY)
		
		local novoFixture = love.physics.newFixture(body, novoShape, 4)
		novoFixture:setFilterData(2,1,-1)
		--print("novo x = "..novoBody:getX().." novo y = "..novoBody:getY())

		--if i == 6 then 
--			local novoJoint = love.physics.newWeldJoint(novoBody, body,mediaX,mediaY, 0, 0, false)
--		end
		table.insert(shapes,novoShape)

		if tuplas[i].raioRoda>2 then
			--print ("gerando roda de raio "..tuplas[i].raioRoda)
			table.insert(rodas,geraRoda(mundo,tuplas[i].raioRoda,converteVelocidade(velocidade,tuplas[i].raioRoda),pontos[i].x,pontos[i].y,body))
		else
			--print("raio roda era "..tuplas[i].raioRoda)
		end
	end
	body:setX(400)
	body:setY(200)
	local hash =velocidade+d[1]+d[2]+d[3]+d[4]+d[5]+d[6]+a[1]+a[2]+a[3]+a[4]+a[5]+a[6]+r[1]+r[2]+r[3]+r[4]+r[5]+r[6]
	 rgba = {}
	table.insert(rgba,(hash+50)%255)  -- red
	table.insert(rgba,(hash+100)%255)  -- green
	table.insert(rgba,(hash+200)%255)  -- blue
	return {body=body,shapes=shapes,rodas=rodas,rgba = rgba}
end

function geraRoda(mundo,raio,velocidade,posx,posy,bodyPai)
	posx,posy = bodyPai:getWorldPoints(posx,posy)
	--print("criou roda em "..posx..","..posy)
	local body = love.physics.newBody(mundo,posx,posy,"dynamic")
	local shape = love.physics.newCircleShape(raio)
	--print("criou roda com raio "..raio)
	local fixture = love.physics.newFixture(body,shape,2) --1 eh a densidade
	fixture:setFilterData(2,1,-1)
	local joint = love.physics.newDistanceJoint(body, bodyPai, posx,posy,posx,posy, false)
	return {raio = raio, velocidade = velocidade*0.5, body = body,shape = shape}
end

function converteVelocidade(velocidadeAngular,raio)
	local velocidadeLinear = velocidadeAngular*raio/100
	return velocidadeLinear --VAI COSTAO -- FUI
end
