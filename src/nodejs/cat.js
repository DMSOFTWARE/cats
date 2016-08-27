#!/usr/bin/nodejs

var fs = require('fs');
var process = require('process');

fs.open('../data','r',
	function(status,fd){
	    if (status) {
		console.log(status.message);
		return;
	    }
	    var buffer = new Buffer(131072);
	    var eof=false;
	    while (! eof) {
		fs.read(fd, buffer, 0, 131072, 0, function(err, num, buffer) {
		    if (num == 0) { eof=true; }
		    else {
			process.stdout.write(buffer);
		    }
		});
	    }
	    process.exit(0);
	});
