#!/bin/bash

# Attempt to run the command up to 5 times
for i in {1..5}; do
    flutter pub get
    flutter build apk && exit 0
    cd android && ./gradlew --stop
    echo "Attempt $i failed... retrying in 10 seconds"
    sleep 10
    ./gradlew clean
    flutter clean
    cd ..
done

# Optionally exit with an error or success here
exit 1