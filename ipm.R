library(ggplot2)
library(gridExtra)

ipm <- read.csv('processed-ipm-2004-2012.csv')

melek_huruf <- ggplot(data = subset(ipm, (ipm$indikator_ipm == 'Angka Melek Huruf')), aes(x = nilai))+
  geom_histogram(color = 'black', fill = 'blue', binwidth = 1) +
  scale_x_continuous(breaks = seq(0,100,5)) +
  xlab('Persen') +
  ylab('Banyak kab/kota') +
  ggtitle('Melek huruf')

plotipm <- ggplot(data = subset(ipm, (ipm$indikator_ipm == 'IPM')), aes(x = nilai/100))+
  geom_histogram(color = 'black', fill = 'blue', binwidth = 0.01) +
  scale_x_continuous(limits = c(0.4,0.8), breaks = seq(0.4,0.8,0.05)) +
  xlab('Indeks IPM') +
  ylab('Banyak kab/kota') +
  ggtitle('IPM')

grid.arrange(melek_huruf, plotipm)

dataipm <- subset(ipm, ipm$indikator_ipm == 'IPM')
summary(dataipm$nilai)