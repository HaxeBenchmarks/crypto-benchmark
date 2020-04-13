import haxe.Timer;
import haxe.crypto.BCrypt;

class BCryptBenchmark {
	private static inline var LIMIT_DATA:Int = 24;

	public function new() {
		var startTime = Timer.stamp();

		var allHashes:Array<String> = [];
		for (index in 0...LIMIT_DATA) {
			var text:String = Data.DATA[index];
			var salt:String = BCrypt.generateSalt(6 + (index % 6));
			allHashes.push(BCrypt.encode(text, salt));
		}

		for (index in 0...LIMIT_DATA) {
			BCrypt.verify(Data.DATA[index], allHashes[index]);
		}

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
