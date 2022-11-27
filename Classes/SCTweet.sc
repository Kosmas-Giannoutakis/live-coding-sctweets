SCTweet : TweetLiveCodingSession {


	*paste {
		arg composer, tweet, amp= -32;
		var bus, current_document, tweets_dictionary, accumulated_amplitudes;

		tweets_dictionary = "scTweets.scd".resolveRelative.load;
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

}