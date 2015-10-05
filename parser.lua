parseador = "(%d+);(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+);(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+);(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)"

local function comp(tupla1,tupla2)
	return tupla1.angulo<tupla2.angulo
end

function parseLinha(linha)
	d = {} --distancias do centro
	a = {} -- angulo de cada um dos vertices
	r = {} -- raio de cada uma das rodas. (0 == nao tem)
	velocidade,d[1],d[2],d[3],d[4],d[5],d[6],d[7],d[8],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],r[1],r[2],r[3],r[4],r[5],r[6],r[7],r[8] = linha:match(parseador)
	tuplas = {}
	for i=1,8 do
		--print("i = "..i)
		table.insert(tuplas,{angulo=tonumber(a[i]),distancia=tonumber(d[i]),raioRoda=tonumber(r[i])*0.1})
	end
	table.sort(tuplas,comp)
	
	return velocidade,tuplas
end
