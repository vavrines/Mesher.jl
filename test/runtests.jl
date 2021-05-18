using Test, FiniteMesh

cd(@__DIR__)
cells, nodes = read_mesh("../mesh/Gmsh/t1.msh")
cellid = extract_cell(cells)
edgeNodes, edgeCells, cellNeighbors = mesh_connectivity_2D(cellid)
cellType = mesh_cell_type(cellNeighbors)
cellArea = mesh_area_2D(nodes, cellid)
cellCenter = mesh_center_2D(nodes, cellid)
edgeCenter = mesh_face_center(nodes, edgeNodes)
cellEdges = mesh_cell_face(cellid, edgeCells)
edgeType = mesh_face_type(edgeCells, cellType)

cells, nodes = read_mesh("../mesh/Gmsh/square.msh")
cellid = extract_cell(cells)
edgeNodes, edgeCells, cellNeighbors = mesh_connectivity_2D(cellid)
cellArea = mesh_area_2D(nodes, cellid)

cells, nodes = read_mesh("../mesh/SU2/naca0012.su2")
add_group!(cells, "../mesh/SU2/naca0012.su2")

rg = [0.1, 0.3, 0.5, 0.7, 0.9]
x = hcat(rg, rg, rg)
rg = [0.1 0.3 0.5]
y = vcat(rg, rg, rg, rg, rg)

cells, points = unstructured_grid(cat(x, y, dims=3), [0., 1.], [0., 0.6])

_points = zeros(4, 2)
_points[2,:] = [1.,0.]
_points[3,:] = [1.,1.]
_points[4,:] = [0.,1.]

cells = triangulate(_points)
