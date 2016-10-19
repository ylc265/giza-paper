set terminal postscript eps size 3.5,2.62 enhanced color font 'Helvetica,20' linewidth 2
#set output 'object_size-storage_capacity.eps'
#set output '|gs -sDEVICE=pdfwrite -sOutputFile=object_size-storage_capacity.pdf -dBATCH -dNOPAUSE  -f -'
set output '|gs -sDEVICE=pdfwrite -sOutputFile=- -dBATCH -dNOPAUSE  -f - | pdfcrop -margins 10 - write_read_gap-bytes_read.pdf'

#set terminal epslatex size 3.5,2.62 standalone color colortext
#set output 'object_size-storage_capacity.tex'

set key right bottom box height .75

set xlabel 'Object Age when Read'
set ylabel 'CDF (%)'
set logscale x
set ytics ("0" 0, "20" 0.2, "40" 0.4, "60" 0.6, "80" 0.8, "100" 1)
set xtics ("Day" 1, "2" 2 1, "4" 4 1, "Week" 8, "2" 15 1, "Month" 30, "2" 60 1, "Quarter" 90)
#set xtics ("Day" 1, "2" 2 1.0, "Week" 8, "Month" 30, "Quarter" 90)
set boxwidth 0.1 absolute
#set border linewidth 2

set label '2' at 2,-0.05 center font ",16"
set label '4' at 4,-0.05 center font ",16"
set label '2' at 15,-0.05 center font ",16"
#set label '2' at 60,-0.05 center font ",16"

set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 7 ps 1.5
set style line 2 lt 1 lc rgb "#00A000" lw 2 pt 11 ps 1.5
set style line 3 lt 1 lc rgb "#5060D0" lw 2 pt 9 ps 1.5
set style line 4 lt 1 lc rgb "#0000A0" lw 2 pt 8 ps 1.5
set style line 5 lt 1 lc rgb "#D0D000" lw 2 pt 13 ps 1.5
set style line 6 lt 1 lc rgb "#00D0D0" lw 2 pt 12 ps 1.5
set style line 7 lt 1 lc rgb "#B200B2" lw 2 pt 5 ps 1.5

#plot [1:][0:1.05] "<awk '{x=x+$1; print x,$3}' reads_ServerActions_010203-2016_complete.csv.cdf.txt" u 1:2 t 'Bytes Read' with lines ls 1
plot [0.9:100][0:1.05] "reads_ServerActions_010203-2016_complete.csv.cdf.txt" u ($1+1):3 t 'Bytes Read' with lines ls 1
