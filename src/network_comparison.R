# Load the igraph package
library(igraph)

# Define the number of nodes
num_nodes <- 900

# Generate a scale-free graph
scale_free_graph <- barabasi.game(num_nodes)

# Generate an Erdős-Rényi graph with the same number of nodes
# The probability p is chosen to have a similar number of edges as in the scale-free graph
# For simplicity, we'll use a rough estimation for p
p <- 2 * edge_density(scale_free_graph)
erdos_renyi_graph <- erdos.renyi.game(num_nodes, p, type = "gnp")

# Visualization
# For a better visualization, we will use the layout_with_fr for both graphs

# Plot the scale-free graph
plot(scale_free_graph, layout=layout_with_fr(scale_free_graph), main="Scale-Free Graph", vertex.size=7, vertex.label=NA, edge.arrow.size=0.5)

plot(erdos_renyi_graph, layout=layout_with_fr(erdos_renyi_graph), main="Erdős-Rényi Graph", vertex.size=5, vertex.label=NA, edge.arrow.size=2)


# Calculate the properties for Scale-Free graph
sf_average_degree <- mean(degree(scale_free_graph))
sf_transitivity <- transitivity(scale_free_graph, type="average")
sf_path_length <- average.path.length(scale_free_graph)

# Calculate the properties for Erdős-Rényi graph
er_average_degree <- mean(degree(erdos_renyi_graph))
er_transitivity <- transitivity(erdos_renyi_graph, type="average")
er_path_length <- average.path.length(erdos_renyi_graph)

# Create a table summarizing the properties
properties_table <- data.frame(
  Property = c("Average Degree", "Average Clustering Coefficient", "Average Path Length"),
  Scale_Free = c(sf_average_degree, sf_transitivity, sf_path_length),
  Erdos_Renyi = c(er_average_degree, er_transitivity, er_path_length)
)
# Print the table
print(properties_table)
