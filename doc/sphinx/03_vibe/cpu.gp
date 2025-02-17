#!/usr/bin/gnuplot
set terminal pngcairo enhanced size 1024, 768 dashed font 'Helvetica,18'
set output "cpu_20.png"

set title "Parthenon-VIBE Strong Scaling Performance on CTS-1, 20% Memory" font "serif,22"
set xlabel "No. Processing Elements"
set ylabel "Figure of Merit (zone-cycles/sec)"
set format y "%.2e"
set xrange [1:64]
set key left top

set logscale x 2
set logscale y 2

set grid
show grid

set datafile separator comma
set key autotitle columnheader

set style line 1 linetype 6 dashtype 1 linecolor rgb "#FF0000" linewidth 2 pointtype 6 pointsize 3
set style line 2 linetype 1 dashtype 2 linecolor rgb "#FF0000" linewidth 2

plot "cpu_20.csv" using 1:2 with linespoints linestyle 1, "" using 1:3 with line linestyle 2

set output "cpu_40.png"
set title "Parthenon-VIBE Strong Scaling Performance on CTS-1, 40% Memory" font "serif,22"
plot "cpu_40.csv" using 1:2 with linespoints linestyle 1, "" using 1:3 with line linestyle 2


set output "cpu_60.png"
set title "Parthenon-VIBE Strong Scaling Performance on CTS-1, 60% Memory" font "serif,22"
plot "cpu_60.csv" using 1:2 with linespoints linestyle 1, "" using 1:3 with line linestyle 2

set xrange [4:120]

set output "ats3_40.png"
set title "Parthenon-VIBE Strong Scaling Performance on ATS-3, 40% Memory" font "serif,22"
plot "parthenon-ats5_spr-hbm128-intel-classic.csv" using 1:2 with linespoints linestyle 1


set output "ats3_60.png"
set title "Parthenon-VIBE Strong Scaling Performance on ATS-3, 60% Memory" font "serif,22"
plot "parthenon-ats5_spr-hbm160-intel-classic.csv" using 1:2 with linespoints linestyle 1

