#!/usr/bin/php
<?php
$fh=fopen("../data","rb");
while($chunk=fread($fh,131072)) { echo $chunk; }
?>
