<?php

//
// basic basic proxy
//
function postToString() {
  $query_string = "";
  if ($_POST) {
    $kv = array();
    foreach ($_POST as $key => $value) {
      $kv[] = "$key=$value";
    }
    $query_string = join("&", $kv);
  }
  else {
    $query_string = $_SERVER['QUERY_STRING'];
  }
  return $query_string;
}


$url = $_GET['url'];
$postData = str_replace( '\\', "", $_GET['postData']);

error_log("WORKING on: $url and _POST: " . postToString()  .
  " postData: ". $postData . "\n==========\n");

//
function getUrl($url) {
        error_log("Fetch:" . $url);
        $handle = fopen($url, "rb");
        $ret = stream_get_contents($handle);
        fclose($handle);

        error_log("simple GET ret:\n $ret \n");
  header("Content-Type: application/json");
        echo $ret;
}
//
function runCurl ($params){
  $postParams = "";
  if (isset($params) && strlen($params) > 1) {
    $postParams = "-d '" . $params . "'";
  }
  $runCmd = "curl -H 'content-type:application/json' {$postParams} " . $_GET['url'];
  error_log("run cmd: " . $runCmd . "\n\n");
  $output = shell_exec($runCmd);
  error_log("exec ret: $output");
  header("Content-Type: application/json");
  echo "$output";
}


//
if (isset($_GET['url']) && !isset($postData) ) {
        getUrl($_GET['url']);
}
else {
  error_log("=== postData: $postData");
    runCurl($postData); // TODO: should be $_POST
}