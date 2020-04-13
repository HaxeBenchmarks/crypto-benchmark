import haxe.Timer;
import haxe.crypto.BCrypt;

class BCryptBenchmark {
	private static inline var LIMIT_DATA:Int = 13;

	public function new() {
		var startTime = Timer.stamp();

		var allHashes:Array<String> = [];
		for (index in 0...LIMIT_DATA) {
			trace(index);
			var text:String = Data.DATA[index];
			var salt:String = BCrypt.generateSalt(6 + (index % 13));
			trace(salt);
			allHashes.push(BCrypt.encode(text, salt));
		}
		var salt:String = BCrypt.generateSalt(15);
		allHashes.push(BCrypt.encode(Data.DATA.join(""), salt));

		for (index in 0...LIMIT_DATA) {
			trace(index);
			var text:String = Data.DATA[index];
			BCrypt.verify(text, allHashes[index]);
		}
		BCrypt.verify(Data.DATA.join(""), allHashes[allHashes.length - 1]);

		printStats(Timer.stamp() - startTime);
	}

	function printStats(duration:Float) {
		var target = HaxeVersionsMacro.macroMapOutput2Target();
		Sys.println('$target;---;0;0;${Std.string(duration)}');
	}

	static function main() {
		try {
			new BCryptBenchmark();
		} catch (e:Any) {
			trace(e);
		}
	}
}
