// MidiMIX {
//
// 	classvar sBuses, kBuses;
//
// 	*init {
// 		var sBus1, sBus2, sBus3, sBus4, sBus5, sBus6, sBus7, sBus8, sBus9;
// 		var kBus11, kBus12, kBus13;
// 		var kBus21, kBus22, kBus23;
// 		var kBus31, kBus32, kBus33;
// 		var kBus41, kBus42, kBus43;
// 		var kBus51, kBus52, kBus53;
// 		var kBus61, kBus62, kBus63;
// 		var kBus71, kBus72, kBus73;
// 		var kBus81, kBus82, kBus83;
//
// 		var s=Server.default;
//
// 		MIDIIn.connectAll;
//
// 		sBus1=Bus.control(s, 1);
// 		sBus2=Bus.control(s, 1);
// 		sBus3=Bus.control(s, 1);
// 		sBus4=Bus.control(s, 1);
// 		sBus5=Bus.control(s, 1);
// 		sBus6=Bus.control(s, 1);
// 		sBus7=Bus.control(s, 1);
// 		sBus8=Bus.control(s, 1);
// 		sBus9=Bus.control(s, 1);
//
// 		kBus11=Bus.control(s, 1);
// 		kBus12=Bus.control(s, 1);
// 		kBus13=Bus.control(s, 1);
//
// 		kBus21=Bus.control(s, 1);
// 		kBus22=Bus.control(s, 1);
// 		kBus23=Bus.control(s, 1);
//
// 		kBus31=Bus.control(s, 1);
// 		kBus32=Bus.control(s, 1);
// 		kBus33=Bus.control(s, 1);
//
// 		kBus41=Bus.control(s, 1);
// 		kBus42=Bus.control(s, 1);
// 		kBus43=Bus.control(s, 1);
//
// 		kBus51=Bus.control(s, 1);
// 		kBus52=Bus.control(s, 1);
// 		kBus53=Bus.control(s, 1);
//
// 		kBus61=Bus.control(s, 1);
// 		kBus62=Bus.control(s, 1);
// 		kBus63=Bus.control(s, 1);
//
// 		kBus71=Bus.control(s, 1);
// 		kBus72=Bus.control(s, 1);
// 		kBus73=Bus.control(s, 1);
//
// 		kBus81=Bus.control(s, 1);
// 		kBus82=Bus.control(s, 1);
// 		kBus83=Bus.control(s, 1);
//
// 		MIDIdef.cc(\controlers, {
// 			arg val, num, char, src;
// 			// [val, num, char, src].postln;
// 			val=(val/127);
// 			if (num==19) {sBus1.value=val};
// 			if (num==23) {sBus2.value=val};
// 			if (num==27) {sBus3.value=val};
// 			if (num==31) {sBus4.value=val};
// 			if (num==49) {sBus5.value=val};
// 			if (num==53) {sBus6.value=val};
// 			if (num==57) {sBus7.value=val};
// 			if (num==61) {sBus8.value=val};
// 			if (num==62) {sBus9.value=val};
//
// 			if (num==16) {kBus11.value=val};
// 			if (num==17) {kBus12.value=val};
// 			if (num==18) {kBus13.value=val};
//
// 			if (num==20) {kBus21.value=val};
// 			if (num==21) {kBus22.value=val};
// 			if (num==22) {kBus23.value=val};
//
// 			if (num==24) {kBus31.value=val};
// 			if (num==25) {kBus32.value=val};
// 			if (num==26) {kBus33.value=val};
//
// 			if (num==28) {kBus41.value=val};
// 			if (num==29) {kBus42.value=val};
// 			if (num==30) {kBus43.value=val};
//
// 			if (num==46) {kBus51.value=val};
// 			if (num==47) {kBus52.value=val};
// 			if (num==48) {kBus53.value=val};
//
// 			if (num==50) {kBus61.value=val};
// 			if (num==51) {kBus62.value=val};
// 			if (num==52) {kBus63.value=val};
//
// 			if (num==54) {kBus71.value=val};
// 			if (num==55) {kBus72.value=val};
// 			if (num==56) {kBus73.value=val};
//
// 			if (num==58) {kBus81.value=val};
// 			if (num==59) {kBus82.value=val};
// 			if (num==60) {kBus83.value=val};
//
// 			MIDIdef.cc(\controlers).permanent = true;
// 		});
//
//
//
// 		sBuses = [sBus1,sBus2,sBus3,sBus4,sBus5,sBus6,sBus7,sBus8,sBus9];
//
// 		kBuses=[
// 			[kBus11, kBus12, kBus13],
// 			[kBus21, kBus22, kBus23],
// 			[kBus31, kBus32, kBus33],
// 			[kBus41, kBus42, kBus43],
// 			[kBus51, kBus52, kBus53],
// 			[kBus61, kBus62, kBus63],
// 			[kBus71, kBus72, kBus73],
// 			[kBus81, kBus82, kBus83]
// 		];
// 	}
//
// 	*returnsBus {
// 		^sBuses;
// 	}
//
// 	*returnkBus {
// 		^kBuses;
// 	}
// }
//
// MSlider : MidiMIX {
//
// 	*new{
// 		arg num=1;
// 		var bus = super.returnsBus[num];
// 		^bus.kr
//
// 	}
// }
//
// MKnob : MidiMIX {
//
// 	*new{
// 		arg col=1, row=1;
// 		var bus = super.returnkBus[col][row];
// 		^bus.kr.lag
//
// 	}
// }