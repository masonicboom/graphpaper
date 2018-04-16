# cluster.R
# Clusters samples of greyscale graph paper into lines, ink dot, and background.
#
# Copyright Mason Simon.

# install.packages('png')
library(png)

set.seed(42)

N <- 6 # Number of notebooks tested.
K <- 3 # Number clusters to find (background, grid, ink dot).
R <- 100 # Number of random restarts to try.

for (n in 1:N) {
	# Load sample.
	i <- readPNG(sprintf('graphpaper%d.png', n))
	
	# Compute clusters.
	k <- kmeans(as.vector(i), K, nstart=R)
	bg <- 1 - max(k$centers)
	grid <- 1 - median(k$centers)
	dot <- 1- min(k$centers)
	
	# Output cluster info.
	cat(sprintf('Sample %d\n', n), file=stdout())
	cat(sprintf('Background:\t%0.2f\n', bg), file=stdout())
	cat(sprintf('Gridlines:\t%0.2f\n', grid), file=stdout())
	cat(sprintf('Ink dot:\t%0.2f\n', dot), file=stdout())
	cat(sprintf('Ink-Grid ratio:\t%0.2f\n', dot/grid), file=stdout())
	cat(sprintf('\n'), file=stdout())
	
	# Plot image, with clusters colored separately and no extra junk around plot.
	kcs <- matrix(k$cluster, nrow=dim(i)[1], ncol=dim(i)[2])
	img <- t(kcs)[,nrow(kcs):1] # Align orientation with scan.
	
	png(filename=sprintf('clustered%d.png', n), width=nrow(img), height=ncol(img))
	par(mar=c(0,0,0,0)) # Remove margin from plot.
	image(img, axes=0) # Plot without axes.
	dev.off()
}
