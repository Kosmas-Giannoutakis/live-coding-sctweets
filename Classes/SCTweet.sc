SCTweet : TweetLiveCodingSession {


	*paste {
		arg composer, tweet, amp= -32;
		var bus, current_document, tweets_dictionary, accumulated_amplitudes;

		tweets_dictionary = "scTweets-fb-8channels.scd".resolveRelative.load;
		accumulated_amplitudes = super.returnDictionary;

		if (accumulated_amplitudes.includesKey([composer.asSymbol, tweet.asSymbol]).not) {
			if (tweets_dictionary.().includesKey(composer.asSymbol)) {
				if (tweets_dictionary.()[composer.asSymbol].includesKey(tweet.asSymbol)) {

					bus = Bus.control(Server.default, 1);

					// insert the tweet as text in the  editor
					current_document = Document.current;
					current_document.insertText("\n\n"++tweets_dictionary.(amp)[composer][tweet], current_document.text.size);

					//write the accumulated rms in a private control bus
					{Integrator.kr(
						RunningSum.kr(
							Mix.ar(
								Ndef(tweet).ar).squared).sqrt)
					}.play(outbus: bus);

					//insert the bus to the dictionary
					accumulated_amplitudes.put([composer,tweet], bus)
				}
				{"tweet name not found".postln}
			}
			{"composer name not found".postln}
		}
		{"tweet-node already tracked".postln}


	}

	*rand {
		arg composer, amp = -32;
		var bus, current_document, accumulated_amplitudes;

		var tweets_dictionary = "scTweets-fb.scd".resolveRelative.load;
		var keysComposer, sizeComposer, randComposer;

		var keysTweets, sizeTweets, randTweet;

		accumulated_amplitudes = super.returnDictionary;

		if (composer.notNil) {composer} {
			keysComposer = tweets_dictionary.().keys.asArray;
			sizeComposer = keysComposer.size;
			randComposer = keysComposer[sizeComposer.rand].asSymbol;
			composer=randComposer
		};

		keysTweets = tweets_dictionary.()[composer].keys.asArray;
		sizeTweets = keysTweets.size;
		randTweet = keysTweets[sizeTweets.rand].asSymbol;

		if (accumulated_amplitudes.includesKey([composer, randTweet]).not) {
			if (tweets_dictionary.().includesKey(composer)) {
				if (tweets_dictionary.()[composer].includesKey(randTweet)) {


					bus = Bus.control(Server.default, 1);

					// insert the tweet as text in the  editor
					current_document = Document.current;
					current_document.insertText("\n\n"++tweets_dictionary.(amp)[composer][randTweet], current_document.text.size);

					//write the accumulated rms in a private control bus
					{Integrator.kr(
						RunningSum.kr(
							Mix.ar(
								Ndef(randTweet).ar).squared).sqrt)
					}.play(outbus: bus);

					//insert the bus to the dictionary
					accumulated_amplitudes.put([composer,randTweet], bus)
				}
				{"tweet name not found".postln}
			}
			{"composer name not found".postln}
		}
		{"tweet-node already tracked".postln}


	}


}