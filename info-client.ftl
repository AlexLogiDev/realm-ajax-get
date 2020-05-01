<div id="info-client"></div>

<script>
    var realm = '${realm.displayName}';
    console.log('realm: ', realm);

    function ajax_get(url, callback) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                console.log('responseText:' + xmlhttp.responseText);
                try {
                    var data = JSON.parse(xmlhttp.responseText);
                } catch(err) {
                    console.log(err.message + " in " + xmlhttp.responseText);
                    return;
                }
                callback(data);
            }
        };
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    ajax_get('https://my-json-server.typicode.com/AlexLogiDev/mock-json-data/realms', function(data) {

        var infoClient = data;

        for(var i = 0; i < infoClient.length; i++) { 
            var html = "<h2>" + infoClient[i]["realm-name"] + "</h2>";
            html += "<h3>" + infoClient[i]["info-client-header"] + "</h3>";
            html += "<p>" + infoClient[i]["info-client-body"] + "</p>";

            document.getElementById("info-client").innerHTML = html;
        }
    });
</script>

