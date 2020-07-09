ROOT_DIR=`pwd`

cd _nowcasts/covid-regional

time sh ./update_nowcasts_cities.sh
time sh ./update_nowcasts.sh

cd ../covid-global
time sh ./update_nowcasts.sh

cd ..
sh bin/update_posts.sh

