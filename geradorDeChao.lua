function geraChao(mundo,shapes)
	local chao = {}
	
	--chao.shape = love.physics.newRectangleShape(8000, 20)
	chao.body = love.physics.newBody( mundo,0, 400,"static")
	chao.shapes = shapes
	for i,v in ipairs(shapes) do
		local novoFixture = love.physics.newFixture(chao.body, v, 1)
		novoFixture:setFilterData(1,2,-2)
	end
	return chao
end

function geraShapeChao()
	local shapes = {}
	local STEP = 25
	yanterior = math.exp(0)
	xanterior = 0
	for x=STEP,12000,STEP do
		xatual = xanterior+STEP/2--love.math.random(xanterior+1,xanterior+STEP)
		yatual = (math.min(math.exp(0.002*xatual)*0.5,30)*math.sin(0.04*xatual))
		novoShape = love.physics.newEdgeShape(x-STEP, yanterior, x, yatual)
		--x1,y1,x2,y2 = novoShape:getPoints()
		--print("adicionou shape, x = "..x.." pontos "..x1.." "..y1.." "..x2.." "..y2)

		table.insert(shapes,novoShape)
		yanterior = yatual
		xanterior = xatual
	end
	return shapes
end