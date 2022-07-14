<html>
  <body>
    <a id='linkButton'>ClickMe</a>
      
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
      
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
      
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
      
    <script type="text/javascript">
      $(document).ready(function() {
        toastr.options.timeOut = 10000; // 1.5s
        toastr.info('Please check your SPAM folder also if not find in INBOX.');
        $('#linkButton').click(function() {
           toastr.success('Click Button');
        });
      });
    </script>
  </body>
</html>