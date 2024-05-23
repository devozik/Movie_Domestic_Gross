getwd()
setwd('/Users/xxxx/xxxx')
movies <- read.csv('Section6-Homework-Data.csv')
head(movies)
str(movies)

factor(movies$Genre)
movies$Genre <- factor(movies$Genre)

factor(movies$Studio)
movies$Studio <- factor(movies$Studio)

factor(movies$Day.of.Week)
movies$Day.of.Week <- factor(movies$Day.of.Week)

movies <- movies[movies$Genre %in% c('action', 'adventure', 'animation', 'comedy', 'drama'),]
movies <- movies[movies$Studio %in% c('Buena Vista Studios', 'Fox', 'Paramount Pictures', 'Universal', 'WB', 'Sony'),]

colnames(movies) <- c('Day_of_week', 'Director', 'Genre', 'Movie_title', 'Release_date', 'Studio', 'Adj_gross',
                      'Budget', 'Gross', 'IMDb_rating', 'Movielens_rating', 'Overseas', 'Overseas_perc', 'Profit',
                      'Profit_perc', 'Runtime', 'US', 'Gross_perc_US')

q <- ggplot(data=movies, aes(x=Genre, y=Gross_perc_US))

q + geom_jitter(aes(size=Budget, color=Studio)) + geom_boxplot(alpha=0.5, outlier.color = NA) +
  xlab('Genre') + ylab('Gross % US') + ggtitle('Domestic Gross % by Genre') +
  theme(axis.title.x = element_text(color='Blue', size=20),
        axis.title.y = element_text(color='Blue', size=20),
        plot.title = element_text(size=30, hjust=0.5),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15))
