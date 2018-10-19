# cluster.R
# Clusters samples of greyscale graph paper into lines, ink dot, and background.
#
# Copyright Mason Simon.

# install.packages('png')
library(png)

set.seed(42)

files <- Sys.glob("scans/graphpaper*.png")

N <- length(files) # Number of notebooks tested.
K <- 3 # Number clusters to find (background, grid, ink dot).
R <- 100 # Number of random restarts to try.

data <- data.frame(description=character(), background=numeric(), gridlines=numeric(), inkdot=numeric())

for (n in 1:N) {
	# Load sample.
	f <- files[n]
	i <- readPNG(f)
	desc <- substr(f, 18, nchar(f)-4)
	
	# Compute clusters.
	k <- kmeans(as.vector(i), K, nstart=R)
	bg <- 1 - max(k$centers)
	grid <- 1 - median(k$centers)
	dot <- 1- min(k$centers)
	
	# Store data.
	data <- rbind(data, data.frame(description=desc, background=sprintf("%0.2f", bg), gridlines=sprintf("%0.2f", grid), inkdot=sprintf("%0.2f", dot), ink.grid.ratio=sprintf("%0.2f", dot/grid)))

	# Plot image, with clusters colored separately and no extra junk around plot.
	kcs <- matrix(k$cluster, nrow=dim(i)[1], ncol=dim(i)[2])
	img <- t(kcs)[,nrow(kcs):1] # Align orientation with scan.

	png(filename=sprintf('results/clustered_%s.png', desc), width=nrow(img), height=ncol(img))
	par(mar=c(0,0,0,0)) # Remove margin from plot.
	image(img, axes=0) # Plot without axes.
	dev.off()
}

write.table(data, file=stdout(), sep="\t", row.names=FALSE, quote=FALSE)
