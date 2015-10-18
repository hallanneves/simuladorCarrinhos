require "parser"
require "geradorCarros"
require "camera"

function love.load()
	mundos = {}
	carros = {}
	for i = 1 , 100 do
		linha = io.read("*line")
		velocidade,tuplas = parseLinha(linha)
		print("tamanho das tuplas"..#tuplas)
		local mundo = love.physics.newWorld(0,10) --gravidade em x e y
		if pcall(function () carro = geraCarro(mundo,velocidade,tuplas) end) then 
			table.insert(mundos,mundo)
			table.insert(carros,carro)
			local chao = {}
			chao.shape = love.physics.newRectangleShape(8000, 20)
			chao.body = love.physics.newBody( mundo,4000, 400,"static")
			chao.fixture = love.physics.newFixture(chao.body, chao.shape, 1)
			chao.fixture:setFilterData(1,2,-2)
			carro.chao = chao
		else
			print("carro "..i.." descartado")
		end


	end



end

function love.update(dt)
	for _,carro in ipairs(carros) do
		for _, roda in ipairs(carro.rodas) do
			roda.body:setAngularVelocity(roda.velocidade)
			--carro.body:setAngle(carro.body:getAngle()+0.2*dt)
		end
	end
	for _,mundo in ipairs(mundos) do
		mundo:update(dt*5)
	end
end


local function maisLonge()
	melhor = 0
	for _,carro in ipairs(carros) do
		melhor = math.max(carro.body:getX(),melhor)
	end
	return melhor
end

function love.draw()
	camera:setPosition(maisLonge()-400,0)
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
		love.graphics.polygon("fill", carro.chao.body:getWorldPoints(carro.chao.shape:getPoints()))
	end
	camera:unset()
end	

