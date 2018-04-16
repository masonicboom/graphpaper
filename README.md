# Graph Paper Analysis

See full writeup at https://masonsimon.com/2018/04/16/quantifying-graph-paper-quality/.

## Usage

Run `Rscript cluster.R` to generate `graphpaper*.png` and output cluster stats. Read `cluster.R` (it's short) and [https://masonsimon.com/2018/04/16/quantifying-graph-paper-quality/](the writeup), for more details.

## Equipment

1. Canon Pixma MG5320 Scanner
2. Pigma Micron 005 Black Ink Pen
3. Various gridded notebooks
4. Scissors
5. iPhone X (camera)
6. My Hackintosh with 40" Display

## Procedure

For each notebook,
1. Cut a small square of graph paper.
2. Draw an ink dot within a grid square by circling pen around one point.
3. Photograph this paper section on top of notebook it came from.
4. Scan in black & white at 300 DPI in PNG format (to avoid compression artifacts). With care taken to position paper in same position in scanner each time.
5. Crop scanned image within borders of grid paper so that only the paper is visible (no white background of the scanner).
6. Run through analysis script (`cluster.R`).

## Results

| Description | Notebook | Scan | Clusters | Gridlines | Grid-Ink Ratio |
| ----------- | -------- | ---- | -------- | --------- | -------------- |
| Unmarked brown notebook | <img src="notebook1.JPG" height="250"> | ![](graphpaper1.png) | ![](clustered1.png) | 0.12 | 6.57 |
| Campus S5 by Kokuyo | <img src="notebook2.JPG" height="250"> | ![](graphpaper2.png) | ![](clustered2.png) | 0.10 | 7.84 |
| Moleskin | <img src="notebook3.JPG" height="250"> | ![](graphpaper3.png) | ![](clustered3.png) | 0.20 | 4.11 |
| Bienfang Gridded Paper | <img src="notebook4.JPG" height="250"> | ![](graphpaper4.png) | ![](clustered4.png) | 0.07 | 11.74 |
| 2-Hole Filler by Kokuyo | <img src="notebook5.JPG" height="250"> | ![](graphpaper5.png) | ![](clustered5.png) | 0.14 | 5.71 |
| Fabriano Spiral Notebook | <img src="notebook6.JPG" height="250"> | ![](graphpaper6.png) | ![](clustered6.png) | 0.15 | 5.32 |
