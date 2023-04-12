FLine {

	*ar {
		arg in, delTime=0, freq=200, rq=20, mul=1, add=0;
		var dline=DelayC.ar(in, 5, delTime);
		var filtered=BPF.ar(dline, freq, rq);
		^(filtered*mul)+add
	}
}

Junction {
	*ar {
		arg in, steepness=1, range=1;
		var compressed=in.stanh(steepness, range);
		var cutDC=LeakDC.ar(compressed);
		^cutDC
	}
}