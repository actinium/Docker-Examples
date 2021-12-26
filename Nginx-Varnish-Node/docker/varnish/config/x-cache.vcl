################################################################################
# X-Cache
#
# See: https://info.varnish-software.com/blog/using-obj-hits
################################################################################
sub vcl_recv {
  unset req.http.X-Cache;
}

sub vcl_hit {
	set req.http.X-Cache = "hit";
}

sub vcl_miss {
	set req.http.X-Cache = "miss";
}

sub vcl_pass {
	set req.http.X-Cache = "pass";
}

sub vcl_pipe {
	set req.http.X-Cache = "pipe uncacheable";
}

sub vcl_synth {
	set resp.http.X-Cache = "synth synth";
}

sub vcl_deliver {
	if (obj.uncacheable) {
		set req.http.X-Cache = req.http.X-Cache + " uncacheable" ;
	} else {
		set req.http.X-Cache = req.http.X-Cache + " cached" ;
	}
	# uncomment the following line to show the information in the response
	set resp.http.X-Cache = req.http.X-Cache;
}
