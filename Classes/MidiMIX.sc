MidiMIX {

	classvar sBuses, kBuses;

	*init {

		var s=Server.default;

		MIDIIn.connectAll;

		sBuses=9.collect({Bus.control(s, 1)});
		kBuses=8.collect({3.collect({Bus.control(s, 1)})});

		MIDIdef.cc(\controlers, {
			arg val, num, char, src;
			var sNums = [19,23,27,31,49,53,57,61,62];
			var kNums = [[16,17,18],[20,21,22],[24,25,26],[28,29,30],[46,47,48],[50,51,52],[54,55,56],[58,59,60]];
			// [val, num, char, src].postln;
			val=(val/127);

			sNums.do({
				arg item, index;
				if (num==item) {sBuses[index].value=val
				}
			});

			kNums.do({
				arg item1, index1;
				item1.do({
					arg item2, index2;
					if (num==item2) {kBuses[index1][index2].value=val
					}
				})
			})
		});

		MIDIdef.cc(\controlers).permanent = true;
	}

	*returnsBus {
		^sBuses;
	}

	*returnkBus {
		^kBuses;
	}
}

MSlider : MidiMIX {

	*new{
		arg num;
		var bus = super.returnsBus[num];
		^bus.kr

	}
}

MKnob : MidiMIX {

	*new{
		arg col=1, row=1;
		var bus = super.returnkBus[col][row];
		^bus.kr.lag

	}
}