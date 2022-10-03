<html>
    <head>
        <title>Test Page</title>
    </head>
    <body>
        <div style="text-align: center;">This is a Test Page</div>
        <input type = "text" id = "textFieldOutsideForm">
        <button onclick="sendRequest()">Send a request</button>

        <script>
            function sendRequest(){
                let text = document.getElementById("textFieldOutsideForm");
                fetch("/testCsrfPost", {
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    method: 'POST',
                    body: 'text=aaa&' +
                        '_csrf=' + '${_csrf.token}'
                }).then(response => {
                    return response.text();
                }).then(text => {
                    document.write(text)
                })
            }

        </script>
    </body>
</html>