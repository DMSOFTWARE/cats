set term png
set title "Utility 'cat' implementation on 5GB of data with 2^17 buffer-size"
set output "sample1.png"
set style data histograms
set style fill solid 1.00 border -1
set xtics border in scale 0,0 nomirror rotate by -270 offset character 0.8, 0, 0 autojustify
plot "sample1.txt" using 2:xticlabels(1) lt rgb "#406090" title columnheader
