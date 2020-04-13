import haxe.Timer;
import haxe.crypto.Sha256;

class Sha256Benchmark {
	public function new() {
		var startTime = Timer.stamp();

		var allHash:StringBuf = new StringBuf();
		for (index in 0...10) {
			for (text in Data.DATA) {
				allHash.add(Sha256.encode(text));
			}
		}

		Sha256.encode(Data.DATA.join(""));
		Sha256.encode(allHash.toString());

		printStats(Timer.stamp() - startTime);
	}

	function printStats(duration:Float) {
		var target = HaxeVersionsMacro.macroMapOutput2Target();
		Sys.println('$target;---;0;0;${Std.string(duration)}');
	}

	static function main() {
		try {
			new Sha256Benchmark();
		} catch (e:Any) {
			trace(e);
		}
	}
}
