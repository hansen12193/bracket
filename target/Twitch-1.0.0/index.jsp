<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <title>Twitch Page</title>
</head>
<body>
<div class="container-fluid">
    <h1>Twitch Test Page</h1>
    <div style="text-align: center">
        <h2 id="online"></h2>
    </div>
    <div class="row">
        <div class="col-xs-3" id="col1">
            <a id="link" target="_blank">
                <img class="logos pulse-button img-responsive" id="logo">
            </a>
            <p style="color: white" class="streaming" id="status"></p>
        </div>
        <div class="col-xs-6 embed-responsive embed-responsive-16by9" id="col2">
            <a class="embed-responsive-item" id="video"></a>
        </div>
        <div class="col-xs-3" id="col3">
            <p>Salt</p>
            <iframe  frameborder="0"
                    scrolling="yes"
                    id="chat"
                    src="https://www.twitch.tv//chat?popout="
                    height="360"
                    width="300">
            </iframe>
        </div>
    </div>
</div>
</div>


<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    var streamer = prompt("Please enter your favorite streamer", "sacriel");
    if (streamer === null) {
        document.getElementById("online").textContent = "No streamer selected";
        document.getElementById("col1").style = "display: none";
        document.getElementById("col2").style = "display: none";
        document.getElementById("col3").style = "display: none";
    }
    else {
        (function () {
            $.getJSON('https://api.twitch.tv/kraken/streams/' + streamer + '?client_id=zf1k5t14okkx0vzghere4i6ppcaxos', function () {
                console.log("success");
            })
                .done(function (data) {
                    if (data.stream === null) {
                        //console.log(JSON.stringify(data));
                        document.getElementById("online").textContent = streamer + " is offline.";
                        document.getElementById("col1").style = "display: none";
                        document.getElementById("col2").style = "display: none";
                        document.getElementById("col3").style = "display: none";
                    }
                    else {
                        console.log(JSON.stringify(data));
                        var game = data.stream.game;
                        var img = new Image();
                        img.src = data.stream.channel.logo;
                        document.getElementById("link").href = data.stream.channel.url;
                        document.getElementById("logo").src = data.stream.channel.logo;
                        document.getElementById("status").textContent = "Streaming " + game;
                    }
                })
                .fail(function () {
                    console.log("error");
                    document.getElementById("stream").innerHTML = "API call failed";
                })
        })();
    }
</script>
<script src="http://player.twitch.tv/js/embed/v1.js"></script>
<script type="text/javascript">
    function watchVid() {
        var options = {
            channel: streamer,
            autoplay: false
        };
        new Twitch.Player("video", options);
    }
</script>
<script>watchVid();</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
