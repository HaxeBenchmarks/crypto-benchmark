import haxe.Timer;
import haxe.crypto.Sha512;

class Sha512Benchmark {
	public function new() {
		var startTime = Timer.stamp();

		var allHash:StringBuf = new StringBuf();
		for (text in Data.DATA) {
			allHash.add(Sha512.encode(text));
		}

		Sha512.encode(Data.DATA.join(""));
		Sha512.encode(allHash.toString());

		printStats(Timer.stamp() - startTime);
	}

	function printStats(duration:Float) {
		var target = HaxeVersionsMacro.macroMapOutput2Target();
		Sys.println('$target;---;0;0;${Std.string(duration)}');
	}

	static function main() {
		try {
			new Sha512Benchmark();
		} catch (e:Any) {
			trace(e);
		}
	}
}
