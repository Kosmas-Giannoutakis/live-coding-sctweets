TweetLiveCodingSession {

	classvar accumulated_amplitudes;

	*new {
		Server.default.waitForBoot(
			accumulated_amplitudes = Dictionary.new);
    }

	*returnDictionary {
		^accumulated_amplitudes;
	}


	*print {
		accumulated_amplitudes.keysValuesDo { |key, value| [key, value.getSynchronous].postln };
	}

	*save {

		var results = [];
		var date = Date.getDate.format("%d_%m_%Y-%H:%M");
		var file = File(Platform.userHomeDir ++"/Documents/SuperCollider/Live-Coding_performances/Performance_data-"++date++".txt", "w");

		accumulated_amplitudes.keysValuesDo {
			|key, value|
			var pair;
			pair=[key, value.getSynchronous];
			results=results.add(pair) };

		file.write(results.asCompileString);
		file.close;
		"file saved".postln;

	}
}