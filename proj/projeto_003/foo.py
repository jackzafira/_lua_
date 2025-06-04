grid_size = 20
grid = []
for x in range(grid_size):  # 0 a 19 (Python começa em 0)
    grid.append([])          # Adiciona uma lista vazia
    for y in range(grid_size):
        grid[x].append(1)
        
for i in grid:
    print(i)