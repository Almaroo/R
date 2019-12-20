hflights %>% group_by(Dest) %>% class
hflights %>% group_by(UniqueCarrier) %>% summarise(avg_dep_del = mean(DepDelay, na.rm = T), avg_arr_del = mean(ArrDelay, na.rm = T)) %>% arrange(avg_dep_del)
hflights %>% group_by(UniqueCarrier, Dest) %>% summarise(avg_dep_del = mean(DepDelay, na.rm = T), avg_arr_del = mean(ArrDelay, na.rm = T)) %>% arrange(avg_dep_del)

hflights %>% group_by(UniqueCarrier, Dest) %>% summarise(n_flights = n()) %>% summarise(n_dest = n()) %>% arrange(desc(n_dest))

#dbplyr -> dplyr dla SQLowych baz danych

#ZAD 1
hflights %>% filter(Distance/(AirTime/60) > 300) %>% summarise(flight_n = n(), min_dist = min(Distance), max_dist = max(Distance), unique_dest_n = n_distinct(Distance))

#ZAD 2
hflights %>% filter(Distance > 1000) %>% group_by(UniqueCarrier) %>% summarise(flights_n = n()) %>% arrange(desc(flights_n))

#ZAD 3
hflights %>% group_by(UniqueCarrier, Dest) %>% summarise(most_popular_dest = n()) %>% filter(most_popular_dest == max(most_popular_dest)) %>% arrange(desc(most_popular_dest)) %>% select(UniqueCarrier, Dest)

#alternatywa
hflights %>% group_by(UniqueCarrier, Dest) %>% summarise(most_popular_dest = n()) %>% arrange(UniqueCarrier, desc(most_popular_dest)) %>% summarise(Dest = first(most_popular_dest)) %>% arrange(desc(most_popular_dest))  
