(
s.waitForBoot({

	var sNums = [19,23,27,31,49,53,57,61,62];
	var kNums = [[16,17,18],[20,21,22],[24,25,26],[28,29,30],[46,47,48],[50,51,52],[54,55,56],[58,59,60]];

	var sliders=9.collect({Bus.control(s, 1)});
	var knobs=8.collect({3.collect({Bus.control(s, 1)})});

	MIDIIn.connectAll;

	sNums.do { |ccnum, index|
		MIDIdef.cc(("slider" ++ ccnum).asSymbol, { |val|
			sliders[index].set((val/127)**4);
		}, ccnum).permanent_(true);
	};

	kNums.do { |item, index1|
		item.do { |ccnum, index2|
			MIDIdef.cc(("knob" ++ ccnum).asSymbol, { |val|
				knobs[index1][index2].set(val/127);
		}, ccnum).permanent_(true);
		}

	};

	~slider = {
		arg num;
		sliders[num-1].kr.lag
	};

	~knob = {
		arg num; //I prefer to give just one argument
		var col=(num/10).asInteger;
		var row=num%10;
		knobs[col-1][row-1].kr.lag
	}
})
)