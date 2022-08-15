<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link rel="stylesheet" href="bootstrap.css"> -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css"
        rel="stylesheet" />
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <table id="tbtable">
        <tr>
            <td><input type="date"></td>
            <td style="width: 200px;">
                <select  name="cars" class="selectProject" style="width: 100%;">
                    <option value="volvo">Volvo</option>
                    <option value="saab">Saab</option>
                    <option value="mercedes">Mercedes</option>
                    <option value="audi">Audi</option>
                </select>
            </td>
        </tr>
    </table>


    <input type="button" value="Duplicate" class="btn btn-click">
    <input type="button" value="Send" onclick="send()" class="btn btn-primary">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(function () {
            $('select').select2();
        });
        $(document).ready(function () {
            $(".btn-click").on('click', function () {
                event.preventDefault()
                $(".selectProject.select2-hidden-accessible").select2('destroy');
                var row = $("#tbtable tr:first");
                var newrow = row.clone();
                $("#tbtable").append(newrow);
                $('.selectProject').select2();
                $(".btn-click").blur();
            });
        });

        function send() {
            
            var sendData = [];
            $('#tbtable tbody tr').each(function(i, el){
                var key = $.trim($(this).find('td:eq(0)').text()),
                val = $.trim($(this).find('td:eq(1)').text()),
                obj = {};
                obj[key] = val;
                sendData.push(obj);
            });
            console.log(JSON.stringify(sendData));
        }

    </script>

</body>

</html>