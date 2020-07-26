#!/bin/bash

ROOT_DIR=`pwd`
DATE=`date`

###################### Nowcast for Brazil ######################
cd $ROOT_DIR/_nowcasts/covid-global
./update_nowcasts.sh &

###################### Nowcast for states ######################
cd $ROOT_DIR/_nowcasts/covid-regional
echo "Starting nowcast for states at `date`"
./update_nowcasts.sh

###################### Nowcast for SE and PI cities ######################
cd $ROOT_DIR/_nowcasts/covid-regional

echo "Starting nowcast for PI cities at `date`"
./update_nowcasts_state_cities.sh PI

echo "Starting nowcast for SE cities at `date`"
./update_nowcasts_state_cities.sh SE

cd $ROOT_DIR
echo "Updating posts and pushing to github at `date`"
bin/update_posts.sh &

###################### Nowcast for PB and AL cities ######################
cd $ROOT_DIR/_nowcasts/covid-regional

echo "Starting nowcast for AL cities at `date`"
./update_nowcasts_state_cities.sh AL

echo "Starting nowcast for PB cities at `date`"
./update_nowcasts_state_cities.sh PB

cd $ROOT_DIR
echo "Updating posts and pushing to github at `date`"
bin/update_posts.sh &

###################### Nowcast for BA cities ######################
cd $ROOT_DIR/_nowcasts/covid-regional
echo "Starting nowcast for BA cities at `date`"
./update_nowcasts_state_cities.sh BA

cd $ROOT_DIR
echo "Updating posts and pushing to github at `date`"
bin/update_posts.sh &

###################### Nowcast for CE cities ######################
cd $ROOT_DIR/_nowcasts/covid-regional
echo "Starting nowcast for CE cities at `date`"
./update_nowcasts_state_cities.sh CE

cd $ROOT_DIR
echo "Updating posts and pushing to github at `date`"
bin/update_posts.sh &

###################### Nowcast for PE cities ######################
cd $ROOT_DIR/_nowcasts/covid-regional
echo "Starting nowcast for PE cities at `date`"
./update_nowcasts_state_cities.sh PE 30

cd $ROOT_DIR
echo "Updating posts and pushing to github at `date`"
bin/update_posts.sh &

###################### Nowcast for MA and RN cities ######################
cd $ROOT_DIR/_nowcasts/covid-regional

echo "Starting nowcast for RN cities at `date`"
./update_nowcasts_state_cities.sh RN

echo "Starting nowcast for MA cities at `date`"
./update_nowcasts_state_cities.sh MA

cd $ROOT_DIR
echo "Updating posts and pushing to github at `date`"
bin/update_posts.sh

