<div id="info-client"></div>

<script>
    // realm ID
    var realm = '${realm.name}';
    console.log('realm.name: ', realm);

    // info client url by realm 
    var infoClientURL = 'https://my-json-server.typicode.com/AlexLogiDev/mock-json-data/realms?realm-name=';

    // current info client
    var currentInfoClientURL = infoClientURL.concat(realm);
    console.log('currentInfoClientURL: ', currentInfoClientURL);

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

    ajax_get(currentInfoClientURL, function(data) {
        var infoClient = data;
        for(var i = 0; i < infoClient.length; i++) {
            var html = "<h3>" + infoClient[i]["info-client-header"] + "</h3>";
            html += "<p>" + infoClient[i]["info-client-body"] + "</p>";
            document.getElementById("info-client").innerHTML = html;
        }
    });
</script>

