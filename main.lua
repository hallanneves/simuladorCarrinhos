require "parser"

function love.load()
	mundos = {}
	carros = {}
	for i = 1 , 101 do
		linha = io.read("*line")
		print("leu "..linha)
		velocidade,tuplas = parseLinha(linha)
		local mundo = love.physics.newWorld(0,10) --gravidade em x e y
		local carro = geraCarro(mundo,velocidade,tuplas)
		table.insert(mundos,mundo)
		table.insert(carros,carro)
	end
end

function love.update(dt)
	for _,mundo in mundos do
		mundo.update(dt)
	end
end

function love.draw()
	for _,carro in carros do
		love.graphics.polygon("fill",carro.shape:getWorldPoints())
		for _,roda in carro.rodas do
			love.graphics.circle("fill",roda.body:getX(),roda.body:getY(),roda.raio,10) --10 eh o numero de segmentos que serao usados no draw da roda
		end
	end
end	