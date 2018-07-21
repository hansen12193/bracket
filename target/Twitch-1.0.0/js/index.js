/**
 * Created by NHansen1 on 4/26/2017.
 */
var streamer = "sxyhxy";
var testing = $.getJSON('https://api.twitch.tv/kraken/streams/' + streamer + '?client_id=zf1k5t14okkx0vzghere4i6ppcaxos', function() {
    console.log("success");
})
    .done(function(data) {
        console.log(JSON.stringify(data));
    })
    .fail(function() {
        console.log("error");
    })
    .always(function() {
        console.log("complete");
    });

