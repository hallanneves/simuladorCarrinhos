require "parser"
require "geradorCarros"
require "camera"
require "geradorDeChao"

function love.load()
	mundos = {}
	carros = {}
	local chaoGlobal = geraShapeChao()
	while true do 
		linha = io.read("*line")
		if linha == nil then
			break
		end
		velocidade,tuplas = parseLinha(linha)
		--print("tamanho das tuplas"..#tuplas)
		local mundo = love.physics.newWorld(0,10) --gravidade em x e y
		if pcall(function () carro = geraCarro(mundo,velocidade,tuplas) end) then 
			--carro = geraCarro(mundo,velocidade,tuplas)
			table.insert(mundos,mundo)
			table.insert(carros,carro)
			carro.chao = geraChao(mundo,chaoGlobal)
			carro.gene = linha
		else
			--print("carro "..i.." descartado")
		end
	end
	tempoSim = 15
end

function love.update(dt)
	dt = dt* 5
	for _,carro in ipairs(carros) do
		for _, roda in ipairs(carro.rodas) do
			roda.body:setAngularVelocity(roda.velocidade)
			--carro.body:setAngle(carro.body:getAngle()+0.2*dt)
		end
	end
	for _,mundo in ipairs(mundos) do
		mundo:update(dt)
	end

	tempoSim = tempoSim - dt
	if tempoSim<= 0 then
		geraSaida()
		love.event.quit()
	end
end

function geraSaida()
	table.sort(carros,function(a,b) return a.body:getX()<b.body:getX() end )
	for _,v in ipairs(carros) do
		print(v.gene)
	end
end


local function maisLonge()
	melhor = 0
	local imelhor = 0
	for i,carro in ipairs(carros) do
		if carro.body:getX()>melhor then 
			melhor = carro.body:getX()
			imelhor = i
		end
	end
	return carros[imelhor].body:getX()-400,carros[imelhor].body:getY()-300
end

function love.draw()
	camera:setPosition(maisLonge())
	camera:set()
	for _,carro in ipairs(carros) do
		
		love.graphics.setLineWidth(2)
		
		for index,shape in ipairs(carro.shapes) do
			love.graphics.setColor(255,0,0)
			love.graphics.polygon("line",carro.body:getWorldPoints(shape:getPoints()))
		end
		love.graphics.setColor(0,255,0)
		for _,roda in ipairs(carro.rodas) do
			love.graphics.circle("line",roda.body:getX(),roda.body:getY(),roda.shape:getRadius(),9) --10 eh o numero de segmentos que serao usados no draw da roda
			love.graphics.line(roda.body:getX(),roda.body:getY(),
				roda.body:getX()+math.cos(roda.body:getAngle())*roda.shape:getRadius(),
				roda.body:getY()+math.sin(roda.body:getAngle())*roda.shape:getRadius())
		end
		for i,v in pairs(carro.chao.shapes) do
			x1,y1,x2,y2 = v:getPoints()
			--print(" pontos "..x1.." "..y1.." "..x2.." "..y2)
			love.graphics.line(carro.chao.body:getWorldPoints(v:getPoints()))
			x1,y1,x2,y2 = carro.chao.body:getWorldPoints(v:getPoints())
			--print(" pontos "..x1.." "..y1.." "..x2.." "..y2)
		end
	end
	camera:unset()
end	

