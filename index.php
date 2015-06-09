<?php

$ch = curl_init("http://www.meuip.com.br/");

$fp = fopen("pagina_exemplo.txt", "w");

curl_setopt($ch, CURLOPT_HEADER, 0);

$resp = curl_exec($ch);
curl_close($ch);

echo "<PRE>";
die(var_dump($resp));



//phpinfo();
