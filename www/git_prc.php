<?php

// check the request is from github before we do anything
if(in_array($_REQUEST['REMOTE_ADDR'], array('207.97.227.253', '50.57.128.197', '108.171.174.178'))) {

    try
    {
      $payload = json_decode($_REQUEST['payload']);
    }
    catch(Exception $e)
    {
      exit(0);
    }

    //log the request
    file_put_contents('../logs/github.txt', print_r($payload, TRUE), FILE_APPEND);


    if ($payload->ref === 'refs/heads/master') {
      // path to your site deployment script
      exec('../build.sh');
    }

}
else {
    exit('IP not allowed');
}