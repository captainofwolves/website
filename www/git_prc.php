<?php

// check the request is from github before we do anything
//in_array($_SERVER['REMOTE_ADDR'], array('207.97.227.253', '50.57.128.197', '108.171.174.178'))
if(1==1) {

    try
    {
      $payload = json_decode($_REQUEST['payload']);
    }
    catch(Exception $e)
    {
      exit(0);
    }

    //log the request
    $logMessage = $payload->head_commit->timestamp.' '.$payload->head_commit->author->username.' '.$payload->head_commit->id."\n".$payload->head_commit->message."\n ------- \n";

    file_put_contents('../logs/github.txt', $logMessage, FILE_APPEND);

    if ($payload->ref === 'refs/heads/master') {
      // path to your site deployment script
      exec('../build.sh');
    }

}
else {
    exit('IP not allowed');
}