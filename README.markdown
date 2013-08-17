Longitude
=========

I've been using Google Latitude to track my location since 2009. Google shut 
Latitude down a few weeks ago, and starting this past Wednesday, my location 
history stopped updating. Bummer. On the plus side, I was able to export all my 
past data via Google Takeout, which gave me a simple JSON feed of my locations 
in the following format: 

    {
        "latitudeE7" : 407188858,
        "longitudeE7" : -739571521,
        "timestampMs" : "1376778016758",
        "accuracy" : 65
    }

This is a quickie app based on the standard iOS Core Data template. It tracks 
your location in the background and stores it in a local database. At any time 
you can dump your history out into a JSON file that matches the Google Location
History format. Set it and forget it. 
