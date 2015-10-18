function love.load()
	x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8 = 1,1,2,2,3,3,4,4,5,5,6,6,7,7,1,8
	pontos = {x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8} 
	shape = love.physics.newPolygonShape(pontos)
	print(#{shape:getPoints()})
end