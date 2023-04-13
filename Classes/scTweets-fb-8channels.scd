(
{
	arg amp = -32;
	Dictionary.newFrom([
		\earslap, (
			\untuned_note_ascending:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\untuned_note_ascending, {
	var x;
	var fb=LocalIn.ar;
	var l1=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
	var jun=Junction.ar(l1, 1, 0.9);
	LocalOut.ar(
		Mix.ar(
			x=SinOsc.ar(
				(Decay.ar(
					Impulse.ar([4,4.005]),
					1e3*jun.abs)*50),
				jun).distort));
    SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\repeated_tone_glitch1:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\repeated_tone_glitch1, {
	var f=LocalIn.ar(2).tanh;
	var k=Latch.kr(
		f[0].abs,
		Impulse.kr(0.5));
	LocalOut.ar(
		f+AllpassN.ar(
			Pulse.ar(
				[2,3],
				k*0.01+1e-6,
				0.9),
			1,k*0.3,100*k))
	;f
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\repeated_tone_glitch1).clear(10)",
			\repeated_tone_glitch2:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\repeated_tone_glitch2, {
	var f=LocalIn.ar(2).tanh;
	var k=Latch.kr(
		f[0].abs,
		Impulse.kr(1/4));
	LocalOut.ar(
		f+CombC.ar(
			Blip.ar(
				[4,6],
				100*k+50,
				0.9),
			1,k*0.3,50*f));
	f
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\repeated_tone_glitch2).clear(10)",
			\bass_glitch:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\bass_glitch, {
    var fb=LocalIn.ar(2);
    var l1=FLine.ar(fb, 0, 200, 10, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var jun=Junction.ar(l1, 1, 0.9);
    var x=AllpassC.ar(
		SinOsc.ar(55).tanh,
		0.4,
		TExpRand.ar(
			2e-4,
			0.4,
			Impulse.ar(8)
		).round([2e-3,4e-3]),
		2);
    LocalOut.ar(x);
    SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\raining:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\raining, {
	Mix({
		a=LFNoise1.ar(0.2.rand);
		DelayC.ar(
			BPF.ar(
				WhiteNoise.ar(Dust2.ar(a*a*4**2).lag(8e-3)),
				10e3.rand+300,
				0.09),
			3,
			a*1.5+1.5,
			45
	)}!80).dup
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\raining).clear(10)",
			\frog_quacking:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\frog_quacking, {
	var a=BPF.ar(
		Saw.ar([40,40.001]),
		LFNoise0.kr(128)+1*4e3+146,
		LFNoise1.kr(1)+1*5e-2+0.01).tanh;
	CombC.ar(
		a,9,
		a.abs.lag(2)*9,
		a.abs.lag(1)*100)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\frog_quacking).clear(10)",
			\atonal_rhythmic_accompaniment:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\atonal_rhythmic_accompaniment, {
    var x;
	LocalOut.ar(
		x=DelayC.ar(
			LPF.ar(
				LFNoise0.ar(8)**2+
				LocalIn.ar(2).tanh.round(0.05),
				6e3),
			1,
			LFNoise0.ar(8!2).range(1e-4,0.02)));
	x.tanh
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\atonal_rhythmic_accompaniment).clear(10)",
			\tone_motif:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\tone_motif, {
	var p=Impulse.ar(8)*LFNoise1.ar(2);
	CombL.ar(
		Saw.ar(
			[3,4],
			Decay.ar(p,0.1)).tanh,
		1,
		TRand.ar(0,0.01,p).round(15e-4),
		TRand.ar(-30,30,p)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\tone_motif).clear(10)",
			\gliding_clusters:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\gliding_clusters, { //10 sec silence after evaluation
	var x;
    LocalOut.ar(
		x=LFNoise1.ar(
			0.5*LocalIn.ar(1)+0.1,
			0.5,
			0.5));
	PitchShift.ar(
		PitchShift.ar(
			Pulse.ar([90,90.01],x),
			10,x*4,x),
		10,4-(x*4),1-x)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\gliding_clusters).clear(10)",
			\minimal_patterns:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\minimal_patterns, { //5 sec silence after evaluation
	var q=[0,3,5,7,10];
	var p=Impulse.kr(4)*LFNoise0.kr>0;
	PitchShift.ar(
		Saw.ar(
			Demand.kr(p,0,Drand((q+12++q+33).midicps,inf)),
			Decay.kr(p,3)),
		7,
		2)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\minimal_patterns).clear(10)",
			\percussive_pentatonic:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\percussive_pentatonic, {
	var p=[0,3,5,7,10,12]+30;
	var a=Demand.kr(Impulse.kr(8),0,Drand(p+24++p,inf));
	(BHiPass.ar(
		LFNoise1.ar(8)**3,
		[a,a+0.2].midicps,
		a/2e3,67-a
	)).tanh
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\percussive_pentatonic).clear(10)",
			\percussive_phrygian:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\percussive_phrygian, {
	var p=[0,0,0,1,5,7,10,12,12,12]+30;
	var a=Duty.kr(1/8,0,Dxrand(p+24++p++p,inf));
	(BHiPass.ar(
		LFNoise1.ar(8)**6,
		[a,a+7].midicps,
		a/3e3,67-a
	)).tanh
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\percussive_phrygian).clear(10)",
			\kick_pattern:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\kick_pattern, {
	var x;
	LeakDC.ar(
		BRF.ar(
			Saw.ar(8,
				Decay2.kr(
					x=Duty.kr(
						1/8,
						0,
						Drand([0,Drand((0.4,0.5..1))],inf)),
					0.01,
					0.3
			))**1.5,
			x*20+[45.1,45],
			0.1
	)).tanh
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\kick_pattern).clear(10)",
			\synth_polyrhythms:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\synth_polyrhythms, {
	p=Impulse.kr(1/4);
	k=Duty.kr(2,0,Dxrand((50,52..90),inf));
	r={|a|
		Saw.ar(
			TIRand.kr(1,6,p),
			a+1*3)}!3;
	BPF.ar(r.sum,[k,k+0.5],1/9,50).tanh
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\synth_polyrhythms).clear(10)",
			\glissandi2major:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\glissandi2major, {
	var a;
	Mix({|k|
		k=k+1/2;
		2/k*Mix({|i|
			i=i+1;
			Blip.ar(
				i*XLine.kr(rand(2e2,4e2),
					87+LFNoise2.kr(2)*k,
					15),
				2,
				1/(i/a=XLine.kr(0.3,1,9))/9
		)}!9
	)}!40
	)!2*a
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\glissandi2major).clear(10)",
			\happy_cricket:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\happy_cricket, {
	var b;
	var r=[0,3,5,7,10,12]+40;
	var p=Duty.ar(1/4,0,Drand((r+12++r).midicps,inf));
	Blip.ar(
		[b=TRand.ar(1500,2e3,Impulse.ar(16)).lag,b+p],
		1
	).mean!2**2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\happy_cricket).clear(10)",
			\high_morse_noise:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\high_morse_noise, {
	var n=LFNoise0.kr(_);
	var v=Blip.ar([2e4,2e4-9],1,n.(16)*0.5+0.5**9);
	42.do{
		v=LeakDC.ar(
			AllpassC.ar(
				v,
				1,
				n.(5)*5e-2+(5e-2+1e-3),
				100
			)
		)
	};tanh(v*99)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\high_morse_noise).clear(10)",
			\big_music_box:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\big_music_box, {
	Mix(
		HPF.ar(
			MidEQ.ar(
				Limiter.ar(
					GVerb.ar(
						HPF.ar(
							Pulse.ar(
								[[0.1,0.11],[0.12,0.13]],
								0.6,
								5e-3
							),
							99
						),
						[[1,5/4],[1.5,2]],
						99
					)
				),
				9e3,
				0.9,
				9
			),
			200
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\big_music_box).clear(10)",
			\beat_synth_outbreaks:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\beat_synth_outbreaks, {
	var fb=LocalIn.ar(2);
	var l1=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
	var jun=Junction.ar(l1, 1, 0.9);
	var i=Impulse.ar(_);
	var x=SinOsc.ar(
		i.(2).lagud(0,0.4)*360,
		Integrator.ar(
			Integrator.ar(
				i.(64).lag(
					LFNoise1.ar(2!2,2,2)
				)*99,
				0.9
			),
			0.99
		).fold2(pi)
	);
	LocalOut.ar(x);
	SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\chiptune_overtones:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\chiptune_overtones, {
	var k;
	Splay.ar(
		Integrator.ar(
			LFNoise0.ar(
				5!3,
				k=Duty.ar(
					6.4,
					0,
					Dseq([0.05,Drand([0.04,0.08],1)],inf)
				)
			).round(k/10)
		).sin.sqrt.tanh,
		0.3
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\chiptune_overtones).clear(10)",
			\glitch_marching:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\glitch_marching, {
	var k;
	LocalOut.ar(
		k=LeakDC.ar(
			Integrator.ar(
				Pulse.ar(
					pi/[1,2.57],
					[0.54,0.46]
				),
				(1-LocalIn.ar(2)).fold(0,[0.9,0.85]
				)
			).wrap2(pi).sin
		)
	);
	k.mean!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\glitch_marching).clear(10)",
			\synth_harmonics_outbreak:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\synth_harmonics_outbreak, {
	var n=LFNoise0.ar(_);
	var f=[60,61];
	tanh(
		BBandPass.ar(
			max(
				max(
					n.(4),
					l=n.(6)
				),
				SinOsc.ar(f*ceil(l*9).lag(0.1))*0.7
			),
			f,
			n.(1).abs/2
		)*700*l.lag(1)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\synth_harmonics_outbreak).clear(10)",
			\crackling:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\crackling, {
	var k, y;
	LocalOut.ar(
		k=tanh(
			500*(
				PinkNoise.ar(1!2)**
				(8/(LagUD.ar(
					y=LocalIn.ar(2).range(0,0.9)+0.1,
					0,
					0.2
				)))
			)
		)
	);
	Splay.ar(k,1-y).sum;
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\crackling).clear(10)",
			\noisy_atonal:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\noisy_atonal, {
	var i=Impulse.ar(8).lag(0.3)!2;
	10.do{
		i=LeakDC.ar(
			AllpassC.ar(
				i,
				1,
				LFNoise0.ar(8).range(1e-5,0.2),
				-0.15,
				LFNoise0.ar(8).range(1,3)
			)
		).tanh
	};
	i
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\noisy_atonal).clear(10)",
			\feedback_resonances:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\feedback_resonances, {
	var n=LFNoise0.kr(*_);
	var v=Blip.ar(
		[60,61],
		5,
		n.(4)**8);
	12.do{
		v=LeakDC.ar(
			CombC.ar(
				v,
				1,
				n.([1,0.05,0.06]).lag(5e3),
				9
			)
		)
	};
	Limiter.ar(v,0.9,1)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\feedback_resonances).clear(10)",
			\ultra_high_frequencies:
		"//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\ultra_high_frequencies, {
	Blip.ar(
		[16e3,16150],
		2,
		LFTri.ar(
			Duty.ar(
				LFNoise0.ar(0.2,4,6),
				0,
				Dseq([70,30,0],inf)
			)
		).clip(0,1)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\ultra_high_frequencies).clear(10)"

	),
		\rukano, (
			\noisy_computer_sounds:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\noisy_computer_sounds, {
	var a=LFNoise0;
	var b=FBSineC.ar(
		a.kr(4,2e4,2e4),
		a.kr(10,16,17),
        1,
		1.005,
		0.7)!2;
	Latch.ar(
		b,
		Impulse.ar(
			a.kr(0.5,5e3,4e3)
		)
	)*a.kr(5,0.4,0.5)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\noisy_computer_sounds).clear(10)",
			\dubstep_bass:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\dubstep_bass, {
	RLPF.ar(
		Latch.ar(
			SinOsc.ar([100,100.5])!2,
			Impulse.ar(
				Duty.kr(
					Dseq([2,1]/4,inf),
					0,
					Drand((67,67.2..70),inf)
				)
			)
		), 800
	).sum
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\dubstep_bass).clear(10)",
			\noise_hail:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\noise_hail, {
	CombN.ar(
		Splay.ar(
			Pulse.ar(
				Gendy3.kr([1,2,4,6])+
				LFNoise0.ar(
					4,
					6,
					Gendy3.kr(5,freq:[10,99])
				)
			)*
			Gendy2.ar([0,1],maxfreq:[55,99])
		),
		3,
		0.4,
		2
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\noise_hail).clear(10)",
			\noisy_meowing:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\noisy_meowing, {
	var x=LFDNoise3;
	Blip.ar(
		x.kr(1,[400,100],500),
		x.kr([1,2],6,5))*
	Gendy3.ar(1,1,1,1,x.kr(1,99,91),1,0.1)*
	x.ar(0.5,0.5,0.5)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\noisy_meowing).clear(10)",
			\synth_lead:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\synth_lead, {
	var a=[1,1.01,2,2.02,3.5,4.01,5.501];
	SinOsc.ar(
		Duty.kr(
			0.2,
			0,
			Dseq([10,11,0,12.2,0,0,10,0]+39,inf).midicps
		)*
		(a++(a*2))
	).sum!2/2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\synth_lead).clear(10)",
			\synth_lead2:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\synth_lead2, {
	SinOsc.ar(
		Duty.kr(
			0.2,
			0,
			Dseq([0,5,0,15,0,12,0,0,12,0,12,0,12,10,0,12]+47,inf).midicps
		)*
		[1,1.01,2,2.02,3.5,4.01,5.501]
	).sum!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\synth_lead2).clear(10)",
			\S_O_S:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\S_O_S, {
	var cpm=60;
	SinOsc.ar(700)!2*
	ToggleFF.ar(
		TDuty.ar(
			Dseq([1,1,1,1,1,2, 2,1,2,1,2,2, 1,1,1,1,1,3]/
				1e3*(6e3/cpm),inf
			)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\S_O_S).clear(10)",
			\noise_metal:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\noise_metal, {
	(SinOsc.ar(
		Latch.ar(
			SinOsc.ar(1.75,0,1e2,2e2),
			Impulse.ar((1,1.1..2)*2)
		).lag(0.1)/2*(1,1.25..8)
	).sum**3!2).tanh
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\noise_metal).clear(10)",
			\rough_synth:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\rough_synth, {
	(SinOsc.ar(
		Latch.ar(
			SinOsc.ar(1.75,0,1e2,2e2),
			Impulse.ar([1,1.0001])
		).lag(0.1)*(1,1.25..8)
	).sum**3!2).tanh
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\rough_synth).clear(10)",
			\sine_melody:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\sine_melody, {
	SinOsc.ar(
		Latch.ar(
			SinOsc.ar(1.3,0,4e2,5e2),
			Impulse.ar([1,1.0001])
		).lag(0.05)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\sine_melody).clear(10)",
			\noisy_wind_storm:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\noisy_wind_storm, {
	var x=LFNoise2.kr(22,5,9);
	CombC.ar(
		Splay.ar(
			Gendy3.ar([4,2],[0.5,1],[1/9,1/4]*x,[1/2,1/8]*x,(9,49..199))
		),
		5,
		[0.13,0.1],
		[x/2,x/2.1]
	).tanh
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\noisy_wind_storm(10)",
			\computer_scifi:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\computer_scifi, {
	var x=TRand.kr(
		30,
		XLine.kr(2e4,30,99,1,1,2),
		Impulse.kr((1..9))
	).cpsmidi.round.midicps;
	Splay.ar(
        SinOsc.ar(x)*
        AmpComp.kr(x,10)
    )
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\computer_scifi).clear(10)",
			\sine_walk_gliss:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\sine_walk_gliss, {
	fork{
		loop{
			d=rrand(1,9);
			play{f=200.rand+60;
				Splay.ar(
					SinOsc.ar(
						XLine.kr(f,(f,f+1..f+f),
							d,1,0,2
						),0,0.1
					)
				)
			};d.wait
		}
	}
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\sine_walk_gliss).clear(10)",
			\ascending_crackings:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\ascending_crackings, {
	RLPF.ar(
		Demand.ar(
			Impulse.ar(20000),
			0,
			Dxrand([Dseq((1,0.005..0)),
				Dseq([1]++(0!555)),
				Dseq((0!999))],inf
			)
		),
		Line.kr(100,3000,80),0.1)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\ascending_crackings).clear(10)",
			\tonal_scales:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\tonal_scales, {
	SinOsc.ar(
		Latch.ar(
			LFSaw.ar(0.3,1,100,300).cpsmidi.round.midicps*
			[1,2],
			Impulse.ar(4)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\tonal_scales).clear(10)",
			\accelerated_barrel_hits:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\accelerated_barrel_hits, {
	var a=(1,0.97..0.005);
	GVerb.ar(
		Decay2.ar(
			TDuty.ar(
				Dseq(a++(a/2)++(a/4)++(a/8)
				)
			),
			XLine.kr(0.05,0.001,15),
			0.1,
			0.05)*9,
		4,
		1
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\accelerated_barrel_hits).clear(10)",
			\hihat_rhythmic_pattern:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\hihat_rhythmic_pattern, {
	var p=TDuty.kr(Dseq([1,1,4,2,2]/8,inf));
	Resonz.ar(
		Crackle.ar!2,
		Demand.kr(p,0,Dseq([250,8e3],inf)),
		Demand.kr(p,0,Dwhite(0.01,0.5,inf)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\hihat_rhythmic_pattern).clear(10)",
			\random_sine_harmonics:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\random_sine_harmonics, {
	var p=Impulse.ar((1,1.3..4)/2).sum;
	Decay2.ar(
		p,
		0.05,
		0.2,
		Splay.ar(
			SinOsc.ar(
				Demand.ar(
					p,
					0,
					Drand((120,180..800),inf)
				)
			)*ToggleFF.ar(p)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\random_sine_harmonics).clear(10)",
			\ragged_sins:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\ragged_sins, {
	SinOsc.ar(
		Latch.ar(
			SinOsc.kr(0.75).range(0,12).round.midiratio*
			[200,400*SinOsc.kr(0.01).range(1,4)],
			TDuty.kr(Dseq([1,2]/8,inf)
			)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play
)
Ndef(\\ragged_sins).clear(10)",
			\sine_glissandos:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\sine_glissandos, \\setsrc -> Pbind(
    \\dur, 1,
    \\source, {
		var x;
		var l=Line;
		Splay.ar (
			SinOsc.ar(
				{x=rrand(1,7)*99;
					l.kr(x,x/(0.25,0.5..4).choose,9)}!9, 0,
				1/9) *
			l.ar(1,0,9,0.5,0.5,2);
		)
    } * " ++ amp ++ ".dbamp
)).quant_(1).fadeTime_(10).play;
)
Ndef(\\sine_glissandos).clear(10)",
			\rhythmic_drops:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\rhythmic_drops, {
	var l=LocalIn.ar+
	Decay2.ar(
		Impulse.ar(3),
		3e-2,
		0.05,
		LFCub.ar(
			LFNoise2.kr(19,500,600)));
	l=DelayN.ar(l,1,1/2);
	LocalOut.ar(l/3);
	l!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\rhythmic_drops).clear(10)",
			\chiptune_accompaniment:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\chiptune_accompaniment, {
	Splay.ar(
		Logistic.ar(
			LFCub.kr([1,2,4,8],0,1.9,2),
			LFNoise0.kr(1/[16,12,8,4],400,999).round(150)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\chiptune_accompaniment).clear(10)",
			\chiptune_interlude:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\chiptune_interlude, {
	Splay.ar(
		Logistic.ar(
			LFCub.kr([1,2,4,6],0,1.5,2),
			LFNoise0.kr(1/[2,2,4,4],250,300).round(50)
		)
	).lag(LFCub.kr(1/8,0.001,0.003))
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\chiptune_interlude).clear(10)",
			\saw_galore:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\saw_galore, {
	var l=LFSaw;
	l.ar(
		l.kr(
			l.kr([1,3],0,4,[5,6]),
			l.kr(1/[4,8]),
			l.kr(1,0,99,100),
			l.kr(
				1/2,
				0,
				50,
				l.kr(1/4,1/3,50,100)
			)
		)
	)/2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\saw_galore).clear(10)",
			\triangle_galore:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\triangle_galore, {
	var l=LFTri;
	l.ar(
		l.kr(
			1/4,
			1/1.5,
			l.kr(1,0,10,10),
			{|i|50+i}!8+
			l.kr(1/3,0,3,40)),
		0,
		l.kr((1..8),0,0.2).excess(0.01)*
		({|i|16-i/20}!16)
	).sum!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\triangle_galore).clear(10)",
			\synth_calling:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\synth_calling, {
	var o=LFCub.kr(1/[4,7,13,19]);
	PitchShift.ar(
		LFPar.ar(o@0*1e3+1e3,0,0.1).lag(1/1000),
		o@3*0.299+0.3,
		o@2*2+2,
		o@1,o[0]*0.1+0.1)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\synth_calling).clear(10)",
			\kalimba_polyrhythm:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\kalimba_polyrhythm, {
	var e=ExpRand;
	Splay.ar(
		Decay2.ar(
			Impulse.ar({e.new(1,8).round/3}!9),
			5e-3,
			{e.new(0.1,1)}!9,
			LFCub.ar({e.new(66,666).round(20)}!9
			)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\kalimba_polyrhythm0.clear(10)",
			\beat_gaida:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\beat_gaida, {
	var a=Decay2.ar(
		Impulse.ar(2),1e-4)*
	SinOsc.ar(40);
	Compander.ar(
		Blip.ar([40,40.5]*
			TChoose.kr(a>0.6,(1..8)),
			4),
		a,8e-3,1,0.001,0.1,1/3
	)+a
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\beat_gaida).clear(10)",
			\glitch_rhythmic_machine:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\glitch_rhythmic_machine, {
	var l=LFNoise2;
	RLPF.ar(
		Crackle.ar,
		SpecPcile.kr(
			FFT(LocalBuf(1024),
				LFGauss.ar(1/[6,8,20].choose,
					0.01
				)
			),0.5
		),
		l.kr(1/8,0.1,0.15),2
	).fold2!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\glitch_rhythmic_machine).clear(10)",
			\random_melody:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\random_melody, {
	var r=LFNoise0.kr(1/4,6,6).round.midiratio;
	Splay.ar(
		{ToggleFF.ar(
			Dust.ar(8.rand+1)).lag(1/99)*
		SinOsc.ar((50,100..800).choose*r)
	}!40)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\random_melody).clear(10)",
			\groove_melody:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\groove_melody, {
	var p=TDuty.kr(Dshuf([4,2,1]/8,inf));
	var c=TChoose;
	Pan2.ar(
		SinOscFB.ar(
			c.kr(p,(50,75..300)),
			Decay2.kr(p)+0.8),
		c.kr(p,[-0.5,0,0.5]).lag)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\groove_melody).clear(10)",
			\harmonic_drone:
			"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\harmonic_drone, {
	var fb=LocalIn.ar(2);
	var l1=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
	var jun=Junction.ar(l1, 1, 1);
	var l=LFNoise2;
	var x=FreeVerb2.ar(
		*XFade2.ar(
			SinOscFB.ar(
				[80,81],
				l.kr(1)+1/2),
			SinOscFB.ar(
				[121,160],
				l.kr(1)+1/2),
			l.kr(1)
		)
	);
	LocalOut.ar(x);
	SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\major_rhythmic_ostinato:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\major_rhythmic_ostinato, {
	var f=LFPar.kr(0.22,0,100,150).round(50).lag;
	Gendy2.ar(6,6,0.5,0.01,f,f+[1,2],1/2,1/2,19,f/4)*
	SetResetFF.ar(
		Impulse.ar(4),
		Dust.ar(4)
	).lag
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\major_rhythmic_ostinato).clear(10)",
			\augmented_major:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\augmented_major, {
	var i=Impulse;
	var a=Splay.ar(
		(PulseCount.ar(i.ar((1..8)),i.ar(1/3))>4)*
		Blip.ar((40,44..62).midicps,2));
	a*0.1+GVerb.ar(
		HPF.ar(a,4e3),
		300,
		14
	).flop.sum*4;
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\augmented_major).clear(10)",
			\fluctuating_sines:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\fluctuating_sines, {
	GVerb.ar(
		Mix(
			9.collect{
				SetResetFF.ar(
					Dust.ar(8.rand+1),
					Dust.ar(8.rand+1)).lag*
				SinOsc.ar(
					LFNoise2.kr(0.1,25,exprand(40,1500)
					)
			)/9}
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\fluctuating_sines).clear(10)",
			\racing_motors:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\racing_motors, {
	var a=0;
	6.do{
		x=Sweep.ar(
			Dust2.kr(0.1+2.0.rand),
			9.rand+9)+
		LFNoise1.kr(0.1,60,80);
		a=a+Pan2.ar(
			Gendy1.ar(1,1,1,1,x,x+9),
			LFNoise2.kr(1)
	)};
	a
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\racing_motors).clear(10)",
			\rhythmic_harmonics:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\rhythmic_harmonics, {
	Splay.ar(
		SinOsc.ar(
			LastValue.kr(
				LFNoise0.kr(3!4,250,220),
				200).round(50)*
			LFPar.kr((1..4)/8,0,{0.02.rand}!4,1),
			0,
			1/2
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\rhythmic_harmonics).clear(10)",
			\alien_spaceship:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\alien_spaceship, {
	var a=Blip.ar(60,4,LFGauss.ar(4,1/8));
	a=a/4+LocalIn.ar(2);
	a=FreqShift.ar(a,LFNoise0.kr(1/4,90));
	LocalOut.ar(DelayC.ar(a,1,0.1,0.9));
	a
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\alien_spaceship).clear(10)",
			\minimal_beat:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\minimal_beat, {
	var l=LocalIn.ar(2)+
	Decay.ar(
		CoinGate.ar(
			0.3,Impulse.ar(8)
		)
	);
	l=BPF.ar(l,99,2);
	LocalOut.ar(
		DelayN.ar(
			l,
			1,
			LFPulse.kr(1/4,1/4,1/2)
		)
	);
	l
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\minimal_beat).clear(10)",
			\wind_on_mic:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\wind_on_mic, {
	LeakDC.ar(
		CompanderD.ar(
			LPF.ar(
				Normalizer.ar(
					CompanderD.ar(
						BrownNoise.ar!2,0.1,0.1,4)
				),
				LFDNoise3.kr(8,90,150)
			), 0.1,1,0.5
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\wind_on_mic).clear(10)",
			\chill_pentantonic:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\chill_pentantonic, {
	GVerb.ar(
		SinOsc.ar(
			Select.kr(
				Hasher.kr(
					Duty.kr(
						(1..4)/4,
						0,
						Dwhite(0,1)
					)
				)*5,midicps([0,3,5,7,10]+60)
			)
	).sum,200,3)/20
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\chill_pentantonic).clear(10)",
			\percussive_blops:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\percussive_blops, {
	var f;
	var p=Impulse.ar(6)+Dust.ar(1);
	var x=(TExpRand.ar(_,_,p));
	Limiter.ar(GVerb.ar(
		GrainFM.ar(2,
			p,
			x.(1e-4,0.01),
			f=x.(80,400),
			f/4,9),
		9,0.5)).flop.sum;
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\percussive_blops).clear(10)",
			\harmonic_polyrthythms:
		"//Tweet by Juan A. Romero (rukano)
//https://github.com/rukano

(Ndef(\\harmonic_polyrhythms, {
	var e=ExpRand;
	RandSeed.kr(1,5);
	Splay.ar(
		Decay2.ar(
			Impulse.ar({e.new(1,8).round/3}!9),
			5e-3,{e.new(0.1,1)}!9,
			LFCub.ar({e.new(66,666)}!9)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\harmonic_polyrhythms).clear(10)"




	),
		\mathk, (
			\crying_babies:
		"//Tweet by mathk
//https://twitter.com/mathk

(Ndef(\\crying_babies, {
	var fb=LocalIn.ar(2);
	var l1=FLine.ar(fb, 0, 200, 20, -20.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -20.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -20.dbamp);
	var jun=Junction.ar(l1, 1, 0.9);
	var k=LFNoise1.kr(8.0.rand+2,0.5,0.5);
	var x=SinOsc.ar([[333,444],[222,555]]*
		(k+(rrand(1.0,5.0))),0,k
	).sum.cubed;
	LocalOut.ar(x);
	SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\major_wandering:
		"//Tweet by mathk
//https://twitter.com/mathk

(Ndef(\\major_wandering, {
	SinOsc.ar([0.501,1,1.001,6.01]*
		Lag.kr(
			LFNoise0.kr(1).range(110,550).round(110),
			0.5),
		0,0.25).sum.clip(-0.6,0.6).cubed.dup
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\major_wandering).clear(10)",
			\inharmonic_hits:
		"//Tweet by mathk
//https://twitter.com/mathk

(Ndef(\\inharmonic_hits, {
	var a=Array.series(7,7,7);
	Limiter.ar(
		Klank.ar(`[a.midicps+777.rand,a/77,a/7],
			Decay.ar(
				Dust.ar([7,0.7]),7)
		).cubed,0.77,0.7
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\inharmonic_hits).clear(10)",
			\phasing_saws:
		"//Tweet by mathk
//https://twitter.com/mathk

(Ndef(\\phasing_saws, {
	var fb=LocalIn.ar(2);
	var l1=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
	var jun=Junction.ar(l1, 1, 0.9);
	var x=RLPF.ar(
		LFSaw.ar([15,15.03],0,0.2),
		LFSaw.ar(
			LFNoise0.kr(0.05,-13,-14)
		).range(200,9000),0.1
	).clip(-0.8,0.3);
	LocalOut.ar(x);
	SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\ruler_bouncing:
		"//Tweet by mathk
//https://twitter.com/mathk

(Ndef(\\ruler_bouncing, {
	var a=Array.series(33,333.rand+111,11.0.rand+1);
	Klank.ar(`[a,a/1111,a/111],
		Impulse.ar([1,1.1]/3)
	).clip(0,1)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\ruler_bouncing).clear(10)",
			\bubbles:
		"//Tweet by mathk
//https://twitter.com/mathk

(Ndef(\\bubbles, {
	BPF.ar(
		Saw.ar(
			LFSaw.ar(
				[1.1,-1.1],0,110,111)/
			11),
		LFSaw.kr(11,0,1110,1111),
		0.1
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\bubbles).clear(10)",
			\alarm:
		"//Tweet by mathk
//https://twitter.com/mathk

(Ndef(\\alarm, {
	Klank.ar(
		`[[86,97,109,120].midicps, [7,5,2,1]/10, 0.4],
		BrownNoise.ar(0.4) *
		Impulse.ar(33)
	)/4!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\alarm).clear(10)"
	),
		\Thor_Magnusson, (
			\aeolian_strings:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\aeolian_strings,{
	Mix.fill(
		9,
		{i=Dust.ar(0.4)!2;
			CombC.ar(i,1,
				Select.ar(
					TIRand.kr(0,7,i),
					(55+Scale.aeolian.degrees)
					.collect{|x|DC.ar(1/x.midicps)
					}
				),3
			)
		}
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\aeolian_strings).clear(10)",
			\arguing_oscs:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\arguing_oscs,{
	{
		var a=SinOsc;
		var l=LFNoise2;
		a.ar(
			666*a.ar(
				l.ar(
					l.ar(0.5)
				)*9
			)*
			RLPF.ar(
				Saw.ar(9),
				l.ar(0.5).range(9,999),
				l.ar(2)
			)
		).cubed
	}!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\arguing_oscs).clear(10)",
			\bon_fire_night:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\bon_fire_night,{
	var x=Decay;
	var d=Dust.ar(4);
	FreeVerb.ar(
		LPF.ar(
			x.ar(d,0.5,WhiteNoise.ar),
			2000)+
		x.ar(d,0.15,SinOsc.ar([40,47],pi,5)),
		0.4,0.6,TRand.ar(0,1,d)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\bon_fire_night).clear(10)",
			\drunk_drummer:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\drunk_drummer,{
	var i=Dust.ar(4);
	var a=0.5;
	var b=5e-3;
	var q=Decay2;
	var p=PulseDivider;
	var n=WhiteNoise.ar;
	(SinOsc.ar(80)*
		q.ar(p.ar(i,2),a,b)+
		(n*q.ar(
			p.ar(i,4),b,a)
		)
	)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\drunk_drummer).clear(10)",
			\for_Eliane_Radigue1:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\for_Eliane_Radigue1,{
	{
		({|i|
			var x=i+1;
			SinOsc.ar(30*x+LFNoise2.ar(0.1).range(-2,2),
				0,
				LFNoise2.ar(0.5)*
				(Line.ar(0,0.1,99.rand)/(x*0.2)
				)
			)
		}!rrand(9,28)
	).sum}!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\for_Eliane_Radigue1).clear(10)",
			\european_music_study:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\european_music_study,{
	var a=Saw;
	var b=220;
	var c=0.3;
	LPF.ar(
		a.ar(b,c)+
		a.ar(LFNoise2.ar(1).range(1.1892,1.2599)*b,c)+
		a.ar(b*1.5,c),
		5e3
	)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\european_music_study).clear(10)",
			\frequency_stacking1:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\frequency_stacking1,{
	{
		{|i|
			SinOsc.ar(
				20+(i*9),
				0,
				SinOsc.ar(2.2.rand).range(0.001,0.1)
			)
		}.sum(200)
	}!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\frequency_stacking1).clear(10)",
			\frequency_stacking3:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\frequency_stacking3,{
	{
		{|i|
			SinOsc.ar(
				20+(i*LFNoise2.ar(1).range(3,10)),
				pi.rand,
				SinOsc.ar(2.2.rand).range(0.001,0.1)
			)
		}.sum(200)
	}!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\frequency_stacking3).clear(10)",
			\lynch:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\lynch ,{
	var b=Buffer.read(s,Platform.resourceDir +/+ \"sounds/a11wlk01.wav\");
	var p=Dust.kr(99);
	var r=TRand;
	var o=Warp1.ar(1,b,r.kr(0,4e4,p),r.kr(0.5,1,p),1)*
	Linen.kr(p,1);
	GVerb.ar(o)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\lynch).clear(10)",
			\for_Eliane_Radigue2:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\for_Eliane_Radigue2 ,{
	{
		(
			{|i|
				var x=i+1;
				var y=LFNoise2.ar(0.1);
				var f=77*(x/2)+y.range(-2,2);
				LPF.ar(
					Saw.ar(f,y*(Line.ar(0,0.2,99.rand)/(x*0.3))),
					f*3
				)
			}!rrand(9,28)
		).sum
	}!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\for_Eliane_Radigue2).clear(10)",
			\rock_manual:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\rock_manual ,{
	var w=WhiteNoise.ar+SinOsc.ar(80,pi/2);
	(
		LPF.ar(w,4e3)*
		Pulse.ar(XLine.ar(14,0.12,6))
	)+
	(EnvGen.ar(
		Env.new([0,0,1,0],[7,0,2]),1,1,0,1,2)
	*w)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\rock_manual).clear(10)",
			\rosetta_comet:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\rosetta_comet ,{
	var l=LFNoise2;
	var o=0.3;
	FreeVerb.ar(
		LPF.ar(
			SinOsc.ar(l.ar(o).range(666,1e3)
			)*
			Saw.ar(17),300),
		l.ar(o)
	)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\rosetta_comet).clear(10)",
			\sleep:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\sleep ,{
	var a=SinOsc.ar(0.15).clip(0,0.3);
	(
		Decay2.ar(LFSaw.ar(13)*a, 0.1)+
		DelayC.ar(
			RLPF.ar(
				PinkNoise.ar(0.3)*a,2300,0.1),
			3,3
		)
	)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\sleep).clear(10)",
			\that_nightclub_downstairs:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\that_nightclub_downstairs ,{
	var x=SinOsc;
	var y=LFNoise0;
	var a=y.ar(8);
	(
		x.ar(Pulse.ar(1)*24)+
		x.ar(90+(a*90))+
		MoogFF.ar(
			Saw.ar(y.ar(4,333,666)),
			a*XLine.ar(1,39,99,99,0,2)
		)
	)!2/3
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1)fadeTime_(10).play;
)
Ndef(\\that_nightclub_downstairs).clear(10)",
			\timpanis:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\timpanis,{
	{
		var x=LFNoise0.ar(1)>0;
		SinOsc.ar(
			Spring.ar(x,4,3e-05)*
			(70.rand+190)+
			LFNoise2.ar(1).range(90,120)
		)*
		EnvGen.kr(
			Env.perc(0.001,5),x)
	}!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\timpanis).clear(10)",
			\txalaparta:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\txalaparta,{
	(
		{|x|
			SOS.ar(
				TBall.ar(
					Impulse.ar(1,x*0.1*x),
					0.8,0.2,0.02)*
				20,0.6,0,0,
				rrand(1.9975, 1.985),-0.9988)
		}!6
	).sum!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\txalaparta).clear(10)",
			\entropic_saw:
		"//Tweet by Thor_Magnusson
//https://thormagnusson.github.io/

(Ndef(\\entropic_saw,{
	var n=99;
	{
		{|x|
			x=x+1;
			SinOsc.ar(
				x*n+(LFNoise2.ar(0.1)*x*LFTri.ar(1/n,0,n,1)),
				0,0.5/x)
		}.dup(n).sum
	}!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\entropic_saw).clear(10)"
	),
		\mutantsounds, (
			\sine_clusters:
		"//Tweet by mutantsounds
//https://www.mutantsounds.com/

(Ndef(\\sine_clusters,{
	Splay.ar(
		SinOsc.ar(
			Array.fill(100,
				{\freq.asSpec.map(LFNoise2.kr(0.001))}
			)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\sine_clusters).clear(10)",
			\low_drone:
		"//Tweet by mutantsounds
//https://www.mutantsounds.com/

(Ndef(\\low_drone,{
	var x=Array.fill(3,
		{Array.fill(50,
			{[40,150].asSpec.map(LFNoise2.kr(0.01))}
		)}
	);
	Splay.ar(
		SinOsc.ar(
			x[0]+
			SinOsc.ar(x[1],0,x[2]-39)
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\low_drone).clear(10)",
			\metallic_high_hits:
		"//Tweet by mutantsounds
//https://www.mutantsounds.com/

(Ndef(\\mettalic_high_hits,{
	var f=[50,55,5000,10000];
	Splay.ar(
		Array.fill(4,
			{|i|
				Ringz.ar(
					RLPF.ar(
						Dust.ar(0.1),
						f[i],
						0.5),
					f[i],
					3
				)
			}
		)
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\mettalic_high_hits).clear(10)"

	),
		\Julian_Rohruber, (
			\electricity:
		"//Tweet by Julian Rohruber
//http://wertlos.org/~rohrhuber/

(Ndef(\\electricity, {
	var fb = LocalIn.ar(2);
	var l1=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
	var jun=Junction.ar(l1, 1, 1);
	var x = SinOsc.ar(BrownNoise.ar(30!2, 200), jun * LFNoise1.kr(1!2,1,1));
	LocalOut.ar(x);
	SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\chdegaulleabout:
		"//Tweet by Julian Rohruber
//http://wertlos.org/~rohrhuber/

(Ndef(\\chdegaulleabout, {
	(SinOsc.ar(
		LFNoise1.kr(0.01).exprange(
			100,
			{exprand(300,10000)}!120
		)
	).mean)!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\chdegaulleabout).clear(10)",
			\sine_stairs:
		"//Tweet by Julian Rohruber
//http://wertlos.org/~rohrhuber/

(Ndef(\\sine_stairs, {
    var fb=LocalIn.ar(2);
    var l1=FLine.ar(fb, 0, 200, 20, -20.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var jun=Junction.ar(l1, 1, 0.9);
    var f={rrand(0.2, 2.0)};
	var x=Splay.ar(
		SinOsc.ar(
			SinOsc.ar(0.02*(f!8)).sum.round(f!8)*
			(f!8+1)*100
		)
	);
    LocalOut.ar(x);
    SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\noise_wind:
		"//Tweet by Julian Rohruber
//http://wertlos.org/~rohrhuber/

(Ndef(\\noise_wind, {
	var x = LocalIn.ar(2);
	var r = SinOsc.ar(x, [0, pi]);
	var y = Splay.ar(
		max(sin(r[0]*
			({ exprand(1.0, 3000.0)}!8)+
			LFNoise1.kr(1!8)
		),0))*0.4;
	LocalOut.ar(y);
	y;
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\noise_wind).clear(10)",
			\nasty_engine:
		"//Tweet by Julian Rohruber
//http://wertlos.org/~rohrhuber/

(Ndef(\\nasty_engine, {
	var fb = LocalIn.ar(2);
	var l1=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
	var jun=Junction.ar(l1, 1.2, 1);
	var x = ring1(
		SinOsc.ar(
			234*XLine.kr(0.1,1,5)+
			LFNoise2.kr(2!2, 5)),
		DelayC.ar(
			jun.reverse,
			0.03,
			0.02+(jun*0.003)
		)
	);
	LocalOut.ar(x);
	SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)"
	),
		\Dan_Stowell, (
			\snare_polyrhythms:
		"\\Tweet by Dan Stowell
\\http://www.mcld.co.uk/research/

(Ndef(\\snare_polyrhythms,{
	{PinkNoise.ar*
		LFSaw.ar(
			0-Duty.kr(
				1,
				0,
				Dseq((2**(0,1..5) ++ [3,3]).scramble,inf)),
			1)
		.range(0,1).squared.squared
	}.dup
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\snare_polyrhythms).clear(10)",
			\rhythmic_wipes:
		"\\Tweet by Dan Stowell
\\http://www.mcld.co.uk/research/

(Ndef(\\rhythmic_wipes,{
	var t=HPZ1.kr(LFNoise0.kr(4));
	{Pulse.ar((t*10000+0.0001).lag(0, 0.1))}.dup+
	(SinOsc.ar([220, 330])*
		Integrator.kr(t)
	)*0.1
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\rhythmic_wipes).clear(10)",
			\rhythmic_sweeps:
		"\\Tweet by Dan Stowell
\\http://www.mcld.co.uk/research/

(Ndef(\\rhythmic_sweeps,{
	var i=LFPulse;
	var k=[100,1];
	i.ar(
		i.kr(5).lag(0.1).linexp(
			0,1,50,
			Duty.kr(0.1,0,
				Dseq([k,Dxrand(11.fib,28)],inf).midicps
			)
		)
	)/9
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\rhythmic_sweeps).clear(10)",
			\noise_gradients:
		"\\Tweet by Dan Stowell
\\http://www.mcld.co.uk/research/

(Ndef(\\noise_gradients,{
	var i=SinOsc;
	var x={exprand(0.1,0.01)};
	Splay.ar({
		[PinkNoise,BrownNoise,GrayNoise].choose.ar*
		i.ar(
			i.ar(0.01).range(x,x)
		)
	}!9)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\noise_gradients).clear(10)",
			\low_high_chip_melody:
		"\\Tweet by Dan Stowell
\\http://www.mcld.co.uk/research/

(Ndef(\\low_high_chip_melody,{
	var fb=LocalIn.ar(2);
	var l1=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
	var jun=Junction.ar(l1, 1, 1);
	var x=Pulse.ar(
		Duty.kr(0.1,0,
			Dseq(\"123456.....ginghamginghamgingham\".as(Array).pyramid.ascii.midicps/2, inf)
		),0.5,0.1
	)!2;
	LocalOut.ar(x);
	SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\atonal_arpeggios:
		"\\Tweet by Dan Stowell
\\http://www.mcld.co.uk/research/

(Ndef(\\atonal_arpeggios,{
	var a=[0.02,0.1,1,2,3,4];
	var k=LFPar.kr(a+0.5).sum;
	var f=Latch.kr(k,Impulse.kr(a));
	Splay.ar(SinOsc.ar(f*100+300)/5)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\atonal_arpeggios).clear(10)",
			\bass_riff_to_noise:
		"\\Tweet by Dan Stowell
\\http://www.mcld.co.uk/research/

(Ndef(\\bass_riff_to_noise,{
	a=Duty.kr(
		0.1,0,Dseq(fib(32).wrap(20,55).midicps,inf)
	);
	HPF.ar(
		LeakDC.ar(
			Splay.ar(
				LFCub.ar([-1,a,a/3,-2]
				)
			)
		)*9

	).clip2/9
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play;
)
Ndef(\\bass_riff_to_noise).clear(10)",
		),
		\headcube, (
			\mysterious_atmo:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\mysterious_atmo, {
	var a=PinkNoise.ar(1!2);
	50.do{
		a=BBandStop.ar(
			a,LFNoise1.kr(0.05.rand).exprange(40,15000),
			exprand(0.1,2)
		)
	};
	LPF.ar(a,1e5)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\mysterious_atmo).clear(10)",
			\trash_beat:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\trash_beat, {
	var a=LFTri.ar(1);
	20.do{a=BAllPass.ar(a,80,1);
		a=((a+0.02)*LFNoise0.kr(1/2)*8).tanh;
		a=LeakDC.ar(a,0.995)};
	a*0.1!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\trash_beat).clear(10)",
			\synth_accompaniment:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\synth_accompaniment, {
	var p={|f,a=1|
		LFPulse.ar(f)*a*[1,1.01]};
	p.(p.(100-p.(1/16,20))+p.(2,1+p.(1/4))-0.5*200)
	+p.(100-p.(1/8,20),p.(8))*0.1
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\synth_accompaniment).clear(10)",
			\evolving_poppings:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\evolving_poppings, {
	var a;
	LocalOut.ar(
		a=CombN.ar(
			BPF.ar(
				LocalIn.ar(2)*7.5+
				Saw.ar([32,33],0.2),
				2**LFNoise0.kr(4/3,4)*300,
				0.1).distort,
			2,2,40
		)
	);
	a
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\evolving_poppings).clear(10)",
			\metallic_rhythms:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\metallic_rhythms, {
	var n={|r,f,d=1|2**LFNoise0.kr(1!d,r)*f};
	{p=n.(4,1e3);
		CombN.ar(
			Ringz.ar(
				LFPulse.ar(1,0,0.01),
				n.(2,p,80),
				0.6).sum,8/5,8/5,60)*
		4e-4!2
	}
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\metallic_rhythms).clear(10)",
			\harmonic_metallic_accompaniment:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\harmonic_metallic_accompaniment, {
	var n={|r,f,n=0,d=1|round(
		r**LFNoise0.ar([4,1,8,2]!d)*
		f,n)
	};
	{Splay.ar(d=n.(3,0.6);
		Ringz.ar(
			d*0.01,
			n.(2,n.(20,400),40,20),
			d
		).mean.tanh
	)}
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\harmonic_metallic_accompaniment).clear(10)",
			\walking_in_the_storm:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\walking_in_the_storm, {
	var p=PinkNoise.ar(1!2);
	BRF.ar(p+Blip.ar(p+2,400),150,2,0.1)+
	LPF.ar(
		FreeVerb2.ar(
			*LPF.ar(
				p+0.2*Dust.ar(0.1),60)++
			[1,1,0.2,1e4]
		).tanh,2000
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\walking_in_the_storm).clear(10)",
			\hunted_sounds:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\hunted_sounds,{
	var w;
	var x=LocalIn.ar+0.01;
	var a=BPF.ar(
		x,
        (6**Latch.ar(x,Dust.ar(x))*200).min(24000),
		0.1).sin;
	9.do{a=AllpassN.ar(a,0.2,{0.2.rand}!2,9)};
	w = a+a.mean;
	LocalOut.ar(Mix.ar(w));
	w;
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\hunted_sounds).clear(10)",
			\fork_on_guitar:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\fork_on_guitar,{
	var x, y;
	y = LPF.ar(
		x=DelayN.ar(
			LeakDC.ar(
				LocalIn.ar(2),
				1-2e-6)*
			0.99,1,0.01)+
		Dust.ar(0.5!2);
		x+(Trig1.ar(
			x<(x.mean.lag(30)),
			4e-3)*0.05),
		800);
	LocalOut.ar(y);
	y;
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\fork_on_guitar).clear(10)",
			\glitch_creatures:
			"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\glitch_creatures,{
    var fb=LocalIn.ar(2);
    var l1=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l2=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var l3=FLine.ar(fb, 0, 200, 20, -0.dbamp);
    var jun=Junction.ar(l1, 1, 1);
    var b=LocalBuf(1e5,2).clear;
	var x=BufRd.ar(2,b,Phasor.ar(0,1,0,1e5));
	BufWr.ar(
		Blip.ar([1,1.01],10)+x,
		b,
		LFNoise1.ar(0.2)+
		1*5e4);
LocalOut.ar(x);
	SplayAz.ar(8, x, 1, 1, 2, 0, 0.5) * ~slider.(#)}
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(1).play)",

			\glitch_machines:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\glitch_machines,{
	var b=LocalBuf(4e5,2).clear;
	BufCombL.ar(
		b,
		LeakDC.ar(
			BufRd.ar(
				2,
				b,
				LFNoise1.ar(0.25)+1*2e5)*0.98)+
		Blip.ar(2!2,10),
		2,
		20
	)/10
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\glitch_machines).clear(10)",
			\blurry_major_sevenths:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\blurry_major_sevenths,{
	var b=LocalBuf(4e5,2).clear;
	BufCombL.ar(
		b,
		LeakDC.ar(
			LPF.ar(
				PlayBuf.ar(2,b,16/15,0,0,1),300))+
		Blip.ar([20,21],1),2,40)/20
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\blurry_major_sevenths).clear(10)",
			\cascade_of_clips:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\cascade_of_clips,{
	var b=LocalBuf(2*SampleRate.ir,2).clear;
	BufCombL.ar(
		b,LeakDC.ar(
			RLPF.ar(
				Limiter.ar(
					PlayBuf.ar(2,b,0.4,0,0,1),0.5)+
				Dust.ar(0.1),
				5e3,0.03
			)
		),1,10
	)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\cascade_of_clips).clear(10)",
			\evolving_chiptunes:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\evolving_chiptunes,{
	({|i|
		var x=Dbufrd(b=LocalBuf(5).clear,i);
		x=x**x-LFNoise0.ar(1/(2**i),50).floor%16;
		Pulse.ar(Duty.ar(1/8,0,Dbufwr(x,b,i))*20)}!5).mean!2
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\evolving_chiptunes).clear(10)",
			\rhythmic_drops:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\rhythmic_drops,{
	var x=Splay.ar({|i|
		RLPF.ar(
			0.6**i*40*Impulse.ar(2**i/32,1/2),
			4**LFNoise0.kr(1/16)*300,
			5e-3).sin}!8);
	2.do{x=FreeVerb2.ar(*x++[0.1,1,1])};
	x
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\rhythmic_drops).clear(10)",
			\resonant_tunnel:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\resonant_tunnel,{
	var x=Saw.ar([50,50.1]);
	8.do{|i|f=2**(8-i);
		x=BRF.ar(
			AllpassN.ar(x,1,0.1/(12-i),2),
			80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2
		)
	};
	x;
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\resonant_tunnel).clear(10)",
			\microtonal_ascending:
		"//Tweet by Nathaniel Virgo (headcube)
//https://headcube.vootrunner.com/

(Ndef(\\microtonal_ascending,{
	var p=Impulse;
	var x;
	mean({|i|
		Pluck.ar(
			LFSaw.ar([102,101]),
			x=p.ar(1,i/10)+p.ar(0),
			1,
			1/Latch.ar(
				1.015**Sweep.ar(0,1)*64%1+1*200,
				x),
			4,0.2
		)
	}!10)
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\microtonal_ascending).clear(10)"

	),
		\Tim_Walters, (
			\scifi_intro:
		"//Tweet by Tim Walters
//http://doubtfulpalace.com/

(Ndef(\\scifi_intro,{
	var y;
	GVerb.ar(({|k|({|i|x=Impulse.kr(0.5**i/k);
		y=SinOsc;
		y.ar(i,y.ar(i+k**i)/
			Decay.kr(x,[i,i+1],k))}!6
	).sum}!16).sum,1)/512
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\scifi_intro).clear(10)",
			\glitch_outbursts:
		"//Tweet by Tim Walters
//http://doubtfulpalace.com/

(Ndef(\\glitch_outbursts,{
	var y;
	({|k|
		({
			|i|
			y=SinOsc;
			y.ar(i*k*k,
                y.ar(i*k**i/[4,5])*
				Decay.kr(
					Dust.kr(1/4**i),
					y.ar(0.1)+1*k+i,
					k*999

				)
			)
		}!8
	).product}!16).sum
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\glitch_outbursts).clear(10)",
			\harmonic_drone1:
		"//Tweet by Tim Walters
//http://doubtfulpalace.com/

(Ndef(\\harmonic_drone1,{
	var x, y;
	({|k|
		x={|f,m,j|
			SinOsc.ar(f+(m*4*j),
				m,
				LFNoise1.ar(j+1/f*4)/2)};
		y=x.(0.1,0,8);
		9.do({|i|
			y=x.(i*k*[4,8],y,i)});
		y}!8
	).sum/4
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\harmonic_drone1).clear(10)",
			\harmonic_drone2:
		"//Tweet by Tim Walters
//http://doubtfulpalace.com/

(Ndef(\\harmonic_drone2,{
	({|i|
		Blip.ar(
			(i+2).sqrt/256,
			3,
			[-1,1].wrapAt(i))*
		Gendy1.ar(6,6,1,Blip.ar(i*i+1*[0.5,0.3],9),i+1*60,i+1*100)
	}!8).sum/4
} * " ++ amp ++ ".dbamp
).reshaping_(\\expanding).clock_(t).quant_(1).fadeTime_(10).play;
)
Ndef(\\harmonic_drone2).clear(10)"
	)

	])
}
)
