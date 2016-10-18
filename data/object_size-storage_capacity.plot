set terminal postscript eps size 3.5,2.62 enhanced color font 'Helvetica,20' linewidth 2
#set output 'object_size-storage_capacity.eps'
#set output '|gs -sDEVICE=pdfwrite -sOutputFile=object_size-storage_capacity.pdf -dBATCH -dNOPAUSE  -f -'
set output '|gs -sDEVICE=pdfwrite -sOutputFile=- -dBATCH -dNOPAUSE  -f - | pdfcrop -margins 10 - object_size-storage_capacity.pdf'

#set terminal epslatex size 3.5,2.62 standalone color colortext
#set output 'object_size-storage_capacity.tex'

set key left top box height .75 width -1.5

set xlabel 'Object Size (MB)'
set ylabel 'CDF (%)'
set logscale x
set ytics ("0" 0, "20" 0.2, "40" 0.4, "60" 0.6, "80" 0.8, "100" 1)
set boxwidth 0.1 absolute
# set border linewidth 2

set style line 1 lt 1 lc rgb "#A00000" lw 2 pt 7 ps 1.5
set style line 2 lt 1 lc rgb "#00A000" lw 2 pt 11 ps 1.5
set style line 3 lt 1 lc rgb "#5060D0" lw 2 pt 9 ps 1.5
set style line 4 lt 1 lc rgb "#0000A0" lw 2 pt 8 ps 1.5
set style line 5 lt 1 lc rgb "#D0D000" lw 2 pt 13 ps 1.5
set style line 6 lt 1 lc rgb "#00D0D0" lw 2 pt 12 ps 1.5
set style line 7 lt 1 lc rgb "#B200B2" lw 2 pt 5 ps 1.5

plot [1:2512][0:1.05] "writes_ServerActions_01-2016.item_size-total_bks.cdf.txt" u 1:3 t 'Storage Capacity' with lines ls 1
