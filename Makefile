analysis: results.tsv
	column -t < $<

results.csv: cluster.R
	Rscript $< > $@

clean:
	rm results/*

