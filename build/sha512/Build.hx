import haxe.Timer;
import haxe.macro.Compiler;

/**
	helper class to build everything, avoids `--next`
**/
class Build {
	/**
		run all build files
	**/
	public static function main() {
		callLix("build/sha512/buildCpp.hxml", "C++");
		callLix("build/sha512/buildCppGCGen.hxml", "C++ (HXCPP_GC_GENERATIONAL)");
		callLix("build/sha512/buildCs.hxml", "C#");
		callLix("build/sha512/buildCppia.hxml", "Cppia");
		callLix("build/sha512/buildJava.hxml", "Java");
		callLix("build/sha512/buildJvm.hxml", "JVM");
		callLix("build/sha512/buildHl.hxml", "HL/Jit");
		callLix("build/sha512/buildHlc.hxml", "HL/C");
		callLix("build/sha512/buildJs.hxml", "JS/ES5");
		callLix("build/sha512/buildJsES6.hxml", "JS/ES6");
		callLix("build/sha512/buildNeko.hxml", "Neko");
		callLix("build/sha512/buildPhp.hxml", "PHP7");
		callLix("build/sha512/buildPython.hxml", "Python");
		callLix("build/sha512/buildLua.hxml", "Lua");
	}

	/**
		perform lix call and take build times

		@param buildFile HXML build file
		@param title description to use when printing build time
	**/
	public static function callLix(buildFile:String, title:String) {
		var startTime = Timer.stamp();
		var exitCode:Int = Sys.command("npx", ["haxe", "build/sha512/common.hxml", buildFile]);
		var exitText:String = "";
		if (exitCode != 0) {
			exitText = ' - exitCode: $exitCode';
		}

		Sys.println('[${Compiler.getDefine("haxe_ver")}] built $title (${Timer.stamp() - startTime})$exitText');
	}
}
